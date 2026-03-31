#!/usr/bin/env python3
import json
import os
import sys
from copy import deepcopy
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Tuple
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


OUTPUT_DIR = Path("build/design-sync")
BASELINE_PATH = Path("design-baselines/design_baseline.json")
IMPACT_MAP_PATH = Path("design-baselines/impact_map.json")


def now_iso() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def fail(message: str) -> None:
    print(f"[design-fetch-diff] ERROR: {message}", file=sys.stderr)
    sys.exit(1)


def read_json_if_exists(path: Path, fallback: Dict[str, Any]) -> Dict[str, Any]:
    if not path.exists():
        return deepcopy(fallback)
    try:
        with path.open("r", encoding="utf-8") as f:
            loaded = json.load(f)
            if isinstance(loaded, dict):
                return loaded
    except Exception:
        pass
    return deepcopy(fallback)


def normalize_snapshot(raw: Dict[str, Any], file_id: str) -> Dict[str, Any]:
    """
    Нормализует входной JSON до стабильной структуры
    для диффа и последующих стадий.
    """
    version = raw.get("version") or raw.get("rev") or raw.get("last_modified") or "unknown"
    payload = raw.get("snapshot") if isinstance(raw.get("snapshot"), dict) else raw

    tokens = payload.get("tokens", {})
    components = payload.get("components", {})
    screens = payload.get("screens", {})
    assets = payload.get("assets", {})

    return {
        "meta": {
            "file_id": file_id,
            "timestamp": now_iso(),
            "version": version,
        },
        "tokens": tokens if isinstance(tokens, dict) else {},
        "components": components if isinstance(components, dict) else {},
        "screens": screens if isinstance(screens, dict) else {},
        "assets": assets if isinstance(assets, dict) else {},
    }


def fetch_snapshot(token: str, file_id: str) -> Dict[str, Any]:
    local_path = os.getenv("PIXSO_SNAPSHOT_JSON_PATH")
    if local_path:
        path = Path(local_path)
        if not path.exists():
            fail(f"Локальный snapshot не найден: {local_path}")
        try:
            with path.open("r", encoding="utf-8") as f:
                data = json.load(f)
                if not isinstance(data, dict):
                    fail("Локальный snapshot содержит некорректный JSON-объект.")
                return data
        except json.JSONDecodeError:
            fail("Локальный snapshot содержит невалидный JSON.")

    templates: List[str] = []
    explicit = os.getenv("PIXSO_SNAPSHOT_URL_TEMPLATE")
    if explicit:
        templates.append(explicit)
    # Приоритет: явный endpoint из CI variable, затем кандидаты.
    templates.extend(
        [
            "https://pixso.net/api/v1/files/{file_id}/snapshot",
            "https://openapi.pixso.net/v1/files/{file_id}/snapshot",
            "https://api.pixso.com/v1/files/{file_id}/snapshot",
        ]
    )

    errors: List[str] = []
    for template in templates:
        url = template.format(file_id=file_id)
        req = Request(
            url,
            headers={
                "Authorization": f"Bearer {token}",
                "Accept": "application/json",
            },
            method="GET",
        )
        try:
            with urlopen(req, timeout=30) as resp:
                payload = resp.read().decode("utf-8")
                data = json.loads(payload)
                if not isinstance(data, dict):
                    fail("Pixso API вернул некорректный JSON-объект.")
                return data
        except HTTPError as e:
            # Для 401/403/404 нет смысла пробовать другие base URL.
            fail(f"Pixso API HTTP {e.code}: {e.reason}. URL: {url}")
        except URLError as e:
            errors.append(f"{url} -> {e.reason}")
        except json.JSONDecodeError:
            fail(f"Pixso API вернул невалидный JSON. URL: {url}")

    fail(
        "Pixso API недоступен по всем endpoint-шаблонам. "
        "Проверь DNS/egress runner-а или задай PIXSO_SNAPSHOT_URL_TEMPLATE. "
        f"Детали: {'; '.join(errors)}"
    )


def diff_dict(
    old: Dict[str, Any],
    new: Dict[str, Any],
    add_type: str,
    remove_type: str,
    change_type: str,
    severity: str,
) -> List[Dict[str, Any]]:
    changes: List[Dict[str, Any]] = []
    all_keys = sorted(set(old.keys()) | set(new.keys()))

    for key in all_keys:
        in_old = key in old
        in_new = key in new

        if not in_old and in_new:
            changes.append(
                {
                    "type": add_type,
                    "entity": key,
                    "before": None,
                    "after": new[key],
                    "severity": severity,
                    "breaking": False,
                }
            )
            continue

        if in_old and not in_new:
            changes.append(
                {
                    "type": remove_type,
                    "entity": key,
                    "before": old[key],
                    "after": None,
                    "severity": "high",
                    "breaking": True,
                }
            )
            continue

        if old[key] != new[key]:
            changes.append(
                {
                    "type": change_type,
                    "entity": key,
                    "before": old[key],
                    "after": new[key],
                    "severity": severity,
                    "breaking": False,
                }
            )

    return changes


def build_design_diff(old_snapshot: Dict[str, Any], new_snapshot: Dict[str, Any]) -> Dict[str, Any]:
    token_changes = diff_dict(
        old_snapshot.get("tokens", {}),
        new_snapshot.get("tokens", {}),
        add_type="token_added",
        remove_type="token_removed",
        change_type="token_changed",
        severity="low",
    )
    component_changes = diff_dict(
        old_snapshot.get("components", {}),
        new_snapshot.get("components", {}),
        add_type="component_added",
        remove_type="component_removed",
        change_type="component_style_changed",
        severity="medium",
    )
    screen_changes = diff_dict(
        old_snapshot.get("screens", {}),
        new_snapshot.get("screens", {}),
        add_type="screen_added",
        remove_type="screen_removed",
        change_type="screen_layout_changed",
        severity="high",
    )
    asset_changes = diff_dict(
        old_snapshot.get("assets", {}),
        new_snapshot.get("assets", {}),
        add_type="asset_added",
        remove_type="asset_removed",
        change_type="asset_changed",
        severity="medium",
    )

    changes = []
    for idx, change in enumerate(token_changes + component_changes + screen_changes + asset_changes, start=1):
        item = dict(change)
        item["id"] = f"change_{idx}"
        changes.append(item)

    diff = {
        "meta": {
            "file_id": new_snapshot.get("meta", {}).get("file_id"),
            "timestamp": now_iso(),
            "base_version": old_snapshot.get("meta", {}).get("version", "unknown"),
            "new_version": new_snapshot.get("meta", {}).get("version", "unknown"),
        },
        "summary": {
            "total_changes": len(changes),
            "tokens_changed": len(token_changes),
            "components_changed": len(component_changes),
            "screens_changed": len(screen_changes),
            "assets_changed": len(asset_changes),
        },
        "changes": changes,
    }
    return diff


def extract_affected_entities(diff: Dict[str, Any]) -> Dict[str, List[str]]:
    result = {
        "tokens": [],
        "components": [],
        "screens": [],
        "assets": [],
    }

    for change in diff.get("changes", []):
        ctype = change.get("type", "")
        entity = change.get("entity")
        if not entity:
            continue
        if ctype.startswith("token_"):
            result["tokens"].append(entity)
        elif ctype.startswith("component_"):
            result["components"].append(entity)
        elif ctype.startswith("screen_"):
            result["screens"].append(entity)
        elif ctype.startswith("asset_") or ctype == "asset_changed":
            result["assets"].append(entity)

    for key in result:
        result[key] = sorted(set(result[key]))
    return result


def map_impacts(
    affected: Dict[str, List[str]],
    impact_map: Dict[str, Any],
) -> Tuple[Dict[str, List[str]], Dict[str, List[str]], Dict[str, Any]]:
    generated_files: set[str] = set()
    manual_files: set[str] = set()
    entry_points: set[str] = set()
    golden_tests: set[str] = set()
    widget_tests: set[str] = set()
    integration_tests: set[str] = set()
    transitive_impact = {"component_usage": {}, "token_usage": {}}

    entity_to_files = impact_map.get("entity_to_code", {})
    entity_to_tests = impact_map.get("entity_to_tests", {})
    component_usage = impact_map.get("component_usage", {})
    token_usage = impact_map.get("token_usage", {})

    def apply_entity(entity: str) -> None:
        for path in entity_to_files.get(entity, {}).get("generated", []):
            generated_files.add(path)
        for path in entity_to_files.get(entity, {}).get("manual", []):
            manual_files.add(path)
        for path in entity_to_files.get(entity, {}).get("entry_points", []):
            entry_points.add(path)

        tests = entity_to_tests.get(entity, {})
        for item in tests.get("golden", []):
            golden_tests.add(item)
        for item in tests.get("widget", []):
            widget_tests.add(item)
        for item in tests.get("integration", []):
            integration_tests.add(item)

    for token in affected["tokens"]:
        apply_entity(token)
        used_by = token_usage.get(token, [])
        transitive_impact["token_usage"][token] = used_by
        for entity in used_by:
            apply_entity(entity)

    for component in affected["components"]:
        apply_entity(component)
        used_by = component_usage.get(component, [])
        transitive_impact["component_usage"][component] = used_by
        for entity in used_by:
            apply_entity(entity)

    for screen in affected["screens"]:
        apply_entity(screen)

    for asset in affected["assets"]:
        apply_entity(asset)

    affected_code = {
        "generated_files": sorted(generated_files),
        "manual_files": sorted(manual_files),
        "entry_points": sorted(entry_points),
    }
    affected_tests = {
        "golden_tests": sorted(golden_tests),
        "widget_tests": sorted(widget_tests),
        "integration_tests": sorted(integration_tests),
    }
    return affected_code, affected_tests, transitive_impact


def build_risk(diff: Dict[str, Any], affected: Dict[str, List[str]]) -> Dict[str, Any]:
    severities = [item.get("severity", "low") for item in diff.get("changes", [])]
    has_high = "high" in severities
    has_medium = "medium" in severities
    multiple_screens = len(affected["screens"]) > 1

    if has_high or multiple_screens:
        level = "high"
    elif has_medium:
        level = "medium"
    else:
        level = "low"

    reasons = []
    if has_high:
        reasons.append("high_severity_design_change")
    if multiple_screens:
        reasons.append("affects_multiple_screens")
    if has_medium and not has_high:
        reasons.append("component_or_asset_change")
    if not reasons:
        reasons.append("token_only_change")

    return {
        "level": level,
        "reasons": reasons,
        "requires_manual_review": level != "low",
        "recommended_reviewers": ["frontend", "design"] if level != "low" else ["frontend"],
    }


def write_json(path: Path, payload: Dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        json.dump(payload, f, ensure_ascii=False, indent=2)
        f.write("\n")


def main() -> None:
    token = os.getenv("PIXSO_TOKEN")
    file_id = os.getenv("PIXSO_FILE")
    if not token:
        fail("Переменная окружения PIXSO_TOKEN не задана.")
    if not file_id:
        fail("Переменная окружения PIXSO_FILE не задана.")

    fallback_snapshot = {
        "meta": {"file_id": file_id, "timestamp": now_iso(), "version": "baseline_v0"},
        "tokens": {},
        "components": {},
        "screens": {},
        "assets": {},
    }

    old_snapshot = read_json_if_exists(BASELINE_PATH, fallback_snapshot)
    raw_new_snapshot = fetch_snapshot(token, file_id)
    new_snapshot = normalize_snapshot(raw_new_snapshot, file_id)

    design_diff = build_design_diff(old_snapshot, new_snapshot)
    affected = extract_affected_entities(design_diff)
    impact_map = read_json_if_exists(
        IMPACT_MAP_PATH,
        {
            "entity_to_code": {},
            "entity_to_tests": {},
            "component_usage": {},
            "token_usage": {},
        },
    )
    affected_code, affected_tests, transitive_impact = map_impacts(affected, impact_map)

    execution_plan = {
        "regenerate": affected_code["generated_files"],
        "skip_regeneration": [] if affected_code["generated_files"] else ["tokens", "components", "screens", "assets"],
        "run_tests": (
            [f"golden:{name}" for name in affected_tests["golden_tests"]]
            + [f"widget:{name}" for name in affected_tests["widget_tests"]]
            + [f"integration:{name}" for name in affected_tests["integration_tests"]]
        ),
        "take_screenshots": affected_tests["golden_tests"],
    }

    impact_report = {
        "meta": {
            "generated_at": now_iso(),
            "based_on_diff": "build/design-sync/design_diff.json",
            "pixso_file": file_id,
        },
        "affected_entities": affected,
        "affected_code": affected_code,
        "affected_tests": affected_tests,
        "transitive_impact": transitive_impact,
        "execution_plan": execution_plan,
        "risk_assessment": build_risk(design_diff, affected),
    }

    write_json(OUTPUT_DIR / "design_snapshot_new.json", new_snapshot)
    write_json(OUTPUT_DIR / "design_diff.json", design_diff)
    write_json(OUTPUT_DIR / "impact_report.json", impact_report)

    print("[design-fetch-diff] Stage 1 успешно завершён.")
    print(f"[design-fetch-diff] Changes: {design_diff['summary']['total_changes']}")


if __name__ == "__main__":
    main()
