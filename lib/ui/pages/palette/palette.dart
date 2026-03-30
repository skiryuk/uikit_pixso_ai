import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/app_tokens.dart';

class PalettePage extends StatelessWidget {
  const PalettePage({super.key});

  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.spaceX4),
                child: Text(
                  'Palette & Tokens',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX2,
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX2,
                ),
                child: Text(
                  'Palette (AppColors)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _ColorGroup(
                title: 'Black',
                colors: [
                  ('main', AppColors.blackMain),
                  ('100', AppColors.black100),
                  ('200', AppColors.black200),
                  ('300', AppColors.black300),
                  ('400', AppColors.black400),
                  ('500', AppColors.black500),
                  ('600', AppColors.black600),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _ColorGroup(
                title: 'Blue',
                colors: [
                  ('main', AppColors.blueMain),
                  ('100', AppColors.blue100),
                  ('200', AppColors.blue200),
                  ('300', AppColors.blue300),
                  ('400', AppColors.blue400),
                  ('500', AppColors.blue500),
                  ('600', AppColors.blue600),
                  ('700', AppColors.blue700),
                  ('800', AppColors.blue800),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _ColorGroup(
                title: 'Red',
                colors: [
                  ('main', AppColors.redMain),
                  ('100', AppColors.red100),
                  ('400', AppColors.red400),
                  ('700', AppColors.red700),
                  ('800', AppColors.red800),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _ColorGroup(
                title: 'Orange',
                colors: [
                  ('main', AppColors.orangeMain),
                  ('300', AppColors.orange300),
                  ('600', AppColors.orange600),
                  ('800', AppColors.orange800),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _ColorGroup(
                title: 'Green',
                colors: [
                  ('main', AppColors.greenMain),
                  ('300', AppColors.green300),
                  ('600', AppColors.green600),
                  ('800', AppColors.green800),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _ColorGroup(
                title: 'White',
                colors: [
                  ('main', AppColors.whiteMain),
                  ('200', AppColors.white200),
                  ('400', AppColors.white400),
                  ('600', AppColors.white600),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX6,
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX2,
                ),
                child: Row(
                  children: [
                    const Text(
                      'Design tokens',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceX2),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.spaceX2,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white24 : Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        isDark ? 'Dark' : 'Light',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceX4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TokenChip(label: 'textPrimary', color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                    _TokenChip(label: 'textSecondary', color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary),
                    _TokenChip(label: 'textAccent', color: isDark ? AppTokensDark.textAccent : AppTokensLight.textAccent),
                    _TokenChip(label: 'textCritical', color: isDark ? AppTokensDark.textCritical : AppTokensLight.textCritical),
                    _TokenChip(label: 'textSuccess', color: isDark ? AppTokensDark.textSuccess : AppTokensLight.textSuccess),
                    _TokenChip(label: 'textCaution', color: isDark ? AppTokensDark.textCaution : AppTokensLight.textCaution),
                    const SizedBox(height: AppSpacing.spaceX2),
                    _TokenChip(label: 'bgPrimary', color: isDark ? AppTokensDark.bgPrimary : AppTokensLight.bgPrimary),
                    _TokenChip(label: 'bgSecondary', color: isDark ? AppTokensDark.bgSecondary : AppTokensLight.bgSecondary),
                    _TokenChip(label: 'bgAccent', color: isDark ? AppTokensDark.bgAccent : AppTokensLight.bgAccent),
                    _TokenChip(label: 'borderPrimary', color: isDark ? AppTokensDark.borderPrimary : AppTokensLight.borderPrimary),
                    const SizedBox(height: AppSpacing.spaceX2),
                    _TokenChip(label: 'surfaceDefault', color: isDark ? AppTokensDark.surfaceDefault : AppTokensLight.surfaceDefault),
                    _TokenChip(label: 'surfaceAccentMain', color: isDark ? AppTokensDark.surfaceAccentMain : AppTokensLight.surfaceAccentMain),
                    _TokenChip(label: 'surfaceCriticalMain', color: isDark ? AppTokensDark.surfaceCriticalMain : AppTokensLight.surfaceCriticalMain),
                    _TokenChip(label: 'surfaceSuccessMain', color: isDark ? AppTokensDark.surfaceSuccessMain : AppTokensLight.surfaceSuccessMain),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX6,
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX2,
                ),
                child: Text(
                  'Spacing (AppSpacing)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceX4),
                child: Wrap(
                  spacing: AppSpacing.spaceX2,
                  runSpacing: AppSpacing.spaceX2,
                  children: [
                    _SpacingChip('spaceX1', AppSpacing.spaceX1),
                    _SpacingChip('spaceX2', AppSpacing.spaceX2),
                    _SpacingChip('spaceX3', AppSpacing.spaceX3),
                    _SpacingChip('spaceX4', AppSpacing.spaceX4),
                    _SpacingChip('spaceX5', AppSpacing.spaceX5),
                    _SpacingChip('spaceX6', AppSpacing.spaceX6),
                    _SpacingChip('space8', AppSpacing.space8),
                    _SpacingChip('space16', AppSpacing.space16),
                    _SpacingChip('space24', AppSpacing.space24),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.spaceX6)),
          ],
        ),
      ),
    );
  }
}

class _ColorGroup extends StatelessWidget {
  const _ColorGroup({required this.title, required this.colors});

  final String title;
  final List<(String name, Color color)> colors;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceX4,
        AppSpacing.spaceX2,
        AppSpacing.spaceX4,
        AppSpacing.spaceX4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: AppSpacing.spaceX2),
          Wrap(
            spacing: AppSpacing.spaceX2,
            runSpacing: AppSpacing.spaceX2,
            children: [
              for (final e in colors)
                _Swatch(name: e.$1, color: e.$2),
            ],
          ),
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSpacing.spaceX1),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _TokenChip extends StatelessWidget {
  const _TokenChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.spaceX2),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 0.5,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.spaceX3),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'monospace',
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpacingChip extends StatelessWidget {
  const _SpacingChip(this.label, this.value);

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: value.clamp(8.0, 64.0),
          height: 24,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$label ($value)',
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
