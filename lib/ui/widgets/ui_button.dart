import 'package:flutter/material.dart';

import '../../core/themes/app_spacing.dart';
import '../../core/themes/app_text_styles.dart';
import '../../core/themes/app_tokens.dart';

// --- Параметры вариантов по макету ---

/// Состояние кнопки (State): по макету — default, hover, disabled
enum UiButtonState {
  default_,
  hover,
  disabled,
}

/// Стиль кнопки (Style): по макету — main, minor
enum UiButtonStyle {
  main,
  minor,
}

/// Семантический тип (Type): по макету — accent, neutral, success, critical
enum UiButtonType {
  accent,
  neutral,
  success,
  critical,
}

/// Размер (Size): по макету — s, m
enum UiButtonSize {
  s,
  m,
}

/// Форма кнопки (Role): по макету — squircle, circle
enum UiButtonRole {
  squircle,
  circle,
}

/// Кнопка со всеми вариантами по макету: State, Style, Type, Size, Role.
class UiButton extends StatefulWidget {
  const UiButton({
    super.key,
    this.state,
    this.style = UiButtonStyle.main,
    this.type = UiButtonType.accent,
    this.size = UiButtonSize.m,
    this.role = UiButtonRole.squircle,
    this.onPressed,
    this.label,
    this.leading,
    this.trailing,
    this.isExpanded = true,
  });

  /// Явное состояние (если null — считается по hover/press/onPressed)
  final UiButtonState? state;
  /// Style: main, minor
  final UiButtonStyle style;
  /// Type: accent, neutral, success, critical
  final UiButtonType type;
  /// Size: s, m
  final UiButtonSize size;
  /// Role: squircle, circle
  final UiButtonRole role;
  final VoidCallback? onPressed;
  final String? label;
  final Widget? leading;
  final Widget? trailing;
  final bool isExpanded;

  @override
  State<UiButton> createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  bool _isHovered = false;

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;
  bool get _enabled => widget.onPressed != null;

  UiButtonState get _effectiveState {
    if (widget.state != null) return widget.state!;
    if (!_enabled) return UiButtonState.disabled;
    if (_isHovered) return UiButtonState.hover;
    return UiButtonState.default_;
  }

  (Color bg, Color fg, Color? border) _colors() {
    final isDark = _isDark;
    final style = widget.style;
    final type = widget.type;
    final state = _effectiveState;

    if (state == UiButtonState.disabled) {
      return _disabledColors(isDark, style, type);
    }

    final hover = state == UiButtonState.hover;

    switch (style) {
      case UiButtonStyle.main:
        return _mainColors(isDark, type, hover);
      case UiButtonStyle.minor:
        return _minorColors(isDark, type, hover);
    }
  }

  (Color, Color, Color?) _mainColors(bool isDark, UiButtonType type, bool hover) {
    switch (type) {
      case UiButtonType.accent:
        if (hover) return (isDark ? AppTokensDark.bgAccentHover : AppTokensLight.bgAccentHover, isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
        return (isDark ? AppTokensDark.bgAccent : AppTokensLight.bgAccent, isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
      case UiButtonType.neutral:
        if (hover) return (isDark ? AppTokensDark.bgSecondaryHover : AppTokensLight.bgSecondaryHover, isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary, isDark ? AppTokensDark.borderPrimary : AppTokensLight.borderPrimary);
        return (isDark ? AppTokensDark.bgSecondary : AppTokensLight.bgSecondary, isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary, isDark ? AppTokensDark.borderPrimary : AppTokensLight.borderPrimary);
      case UiButtonType.success:
        if (hover) return (isDark ? AppTokensDark.surfaceSuccessHover : AppTokensLight.surfaceSuccessHover, isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
        return (isDark ? AppTokensDark.surfaceSuccessMain : AppTokensLight.surfaceSuccessMain, isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
      case UiButtonType.critical:
        if (hover) return (isDark ? AppTokensDark.surfaceCriticalHover : AppTokensLight.surfaceCriticalHover, isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
        return (isDark ? AppTokensDark.surfaceCriticalMain : AppTokensLight.surfaceCriticalMain, isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
    }
  }

  (Color, Color, Color?) _minorColors(bool isDark, UiButtonType type, bool hover) {
    final border = isDark ? AppTokensDark.borderPrimary : AppTokensLight.borderPrimary;
    switch (type) {
      case UiButtonType.accent:
        if (hover) return (isDark ? AppTokensDark.bgAccentSubduedHover : AppTokensLight.bgAccentSubduedHover, isDark ? AppTokensDark.textAccent : AppTokensLight.textAccent, border);
        return (isDark ? AppTokensDark.bgAccentSubdued : AppTokensLight.bgAccentSubdued, isDark ? AppTokensDark.textAccent : AppTokensLight.textAccent, border);
      case UiButtonType.neutral:
        if (hover) return (isDark ? AppTokensDark.bgSecondaryHover : AppTokensLight.bgSecondaryHover, isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary, border);
        return (Colors.transparent, isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary, border);
      case UiButtonType.success:
        if (hover) return (isDark ? AppTokensDark.surfaceSuccessMedium : AppTokensLight.surfaceSuccessMedium, isDark ? AppTokensDark.textSuccess : AppTokensLight.textSuccess, border);
        return (Colors.transparent, isDark ? AppTokensDark.textSuccess : AppTokensLight.textSuccess, border);
      case UiButtonType.critical:
        if (hover) return (isDark ? AppTokensDark.surfaceCriticalMedium : AppTokensLight.surfaceCriticalMedium, isDark ? AppTokensDark.textCritical : AppTokensLight.textCritical, border);
        return (Colors.transparent, isDark ? AppTokensDark.textCritical : AppTokensLight.textCritical, border);
    }
  }

  (Color, Color, Color?) _disabledColors(bool isDark, UiButtonStyle style, UiButtonType type) {
    switch (style) {
      case UiButtonStyle.main:
        switch (type) {
          case UiButtonType.accent:
            return ((isDark ? AppTokensDark.bgAccent : AppTokensLight.bgAccent).withOpacity(0.5), isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
          case UiButtonType.neutral:
            return (isDark ? AppTokensDark.bgSecondary : AppTokensLight.bgSecondary, isDark ? AppTokensDark.textDisabled : AppTokensLight.textDisabled, isDark ? AppTokensDark.borderPrimary : AppTokensLight.borderPrimary);
          case UiButtonType.success:
            return ((isDark ? AppTokensDark.surfaceSuccessMain : AppTokensLight.surfaceSuccessMain).withOpacity(0.5), isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
          case UiButtonType.critical:
            return ((isDark ? AppTokensDark.surfaceCriticalMain : AppTokensLight.surfaceCriticalMain).withOpacity(0.5), isDark ? AppTokensDark.textPrimaryOnColor : AppTokensLight.textPrimaryOnColor, null);
        }
      case UiButtonStyle.minor:
        return (isDark ? AppTokensDark.bgSecondary : AppTokensLight.bgSecondary, isDark ? AppTokensDark.textDisabled : AppTokensLight.textDisabled, isDark ? AppTokensDark.borderSecondary : AppTokensLight.borderSecondary);
    }
  }

  EdgeInsets get _padding {
    final size = widget.size;
    final isCircle = widget.role == UiButtonRole.circle;
    if (isCircle) {
      switch (size) {
        case UiButtonSize.s:
          return const EdgeInsets.all(AppSpacing.spaceX3);
        case UiButtonSize.m:
          return const EdgeInsets.all(AppSpacing.spaceX4);
      }
    }
    switch (size) {
      case UiButtonSize.s:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceX4,
          vertical: AppSpacing.spaceX2,
        );
      case UiButtonSize.m:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceX5,
          vertical: AppSpacing.spaceX3,
        );
    }
  }

  TextStyle get _textStyle {
    switch (widget.size) {
      case UiButtonSize.s:
        return AppTextStyles.smallMedium;
      case UiButtonSize.m:
        return AppTextStyles.bodyMedium;
    }
  }

  double get _iconGap {
    switch (widget.size) {
      case UiButtonSize.s:
        return AppSpacing.spaceX2;
      case UiButtonSize.m:
        return AppSpacing.spaceX3;
    }
  }

  double get _iconSize {
    switch (widget.size) {
      case UiButtonSize.s:
        return 16;
      case UiButtonSize.m:
        return 20;
    }
  }

  BorderRadius get _borderRadius {
    switch (widget.role) {
      case UiButtonRole.squircle:
        return BorderRadius.circular(AppSpacing.spaceX3);
      case UiButtonRole.circle:
        return BorderRadius.circular(999);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (bg, fg, border) = _colors();
    final borderWidth = border != null ? 1.5 : 0.0;
    final isCircle = widget.role == UiButtonRole.circle;
    final hasLabel = widget.label != null && widget.label!.isNotEmpty;
    final hasContent = hasLabel || widget.leading != null || widget.trailing != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          padding: _padding,
          constraints: isCircle
              ? BoxConstraints(
                  minWidth: _iconSize + _padding.horizontal,
                  minHeight: _iconSize + _padding.vertical,
                )
              : null,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: _borderRadius,
            border: border != null
                ? Border.all(color: border, width: borderWidth)
                : null,
          ),
          child: Row(
            mainAxisSize: widget.isExpanded && !isCircle ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.leading != null) ...[
                IconTheme.merge(
                  data: IconThemeData(color: fg, size: _iconSize),
                  child: widget.leading!,
                ),
                if (hasLabel) SizedBox(width: _iconGap),
              ],
              if (hasLabel)
                Flexible(
                  child: Text(
                    widget.label!,
                    style: _textStyle.copyWith(color: fg),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (widget.trailing != null) ...[
                if (hasLabel) SizedBox(width: _iconGap),
                IconTheme.merge(
                  data: IconThemeData(color: fg, size: _iconSize),
                  child: widget.trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
