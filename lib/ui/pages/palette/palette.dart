import 'package:flutter/cupertino.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/app_tokens.dart';
import '../../../core/themes/app_typography.dart';

class PalettePage extends StatelessWidget {
  const PalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark
        ? AppTokensDark.textPrimary
        : AppTokensLight.textPrimary;
    final Color secondaryColor = isDark
        ? AppTokensDark.textSecondary
        : AppTokensLight.textSecondary;
    final Color surfaceColor = isDark
        ? AppTokensDark.bgSecondary
        : AppTokensLight.bgSecondary;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.spacing16),
          children: [
            Text(
              'Palette & Tokens',
              style: AppTypography.h2.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.spacing8),
            Text(
              'Цвета палитры и семантические токены для Light/Dark',
              style: AppTypography.smallRegular.copyWith(color: secondaryColor),
            ),
            const SizedBox(height: AppSpacing.spacing16),
            _PaletteGroup(
              title: 'Blue',
              surfaceColor: surfaceColor,
              items: const [
                _PaletteItem('blueMain', AppColors.blueMain),
                _PaletteItem('blue700', AppColors.blue700),
                _PaletteItem('blue500', AppColors.blue500),
                _PaletteItem('blue300', AppColors.blue300),
                _PaletteItem('blue100', AppColors.blue100),
              ],
            ),
            const SizedBox(height: AppSpacing.spacing12),
            _PaletteGroup(
              title: 'Neutral',
              surfaceColor: surfaceColor,
              items: const [
                _PaletteItem('whiteMain', AppColors.whiteMain),
                _PaletteItem('white500', AppColors.white500),
                _PaletteItem('blackMain', AppColors.blackMain),
                _PaletteItem('black400', AppColors.black400),
                _PaletteItem('black100', AppColors.black100),
              ],
            ),
            const SizedBox(height: AppSpacing.spacing12),
            _PaletteGroup(
              title: 'Status',
              surfaceColor: surfaceColor,
              items: const [
                _PaletteItem('greenMain', AppColors.greenMain),
                _PaletteItem('orangeMain', AppColors.orangeMain),
                _PaletteItem('redMain', AppColors.redMain),
                _PaletteItem('red700', AppColors.red700),
              ],
            ),
            const SizedBox(height: AppSpacing.spacing16),
            _TokenGroup(
              title: 'Text Tokens',
              surfaceColor: surfaceColor,
              rows: const [
                _TokenRow(
                  'textPrimary',
                  AppTokensLight.textPrimary,
                  AppTokensDark.textPrimary,
                ),
                _TokenRow(
                  'textSecondary',
                  AppTokensLight.textSecondary,
                  AppTokensDark.textSecondary,
                ),
                _TokenRow(
                  'textDisabled',
                  AppTokensLight.textDisabled,
                  AppTokensDark.textDisabled,
                ),
                _TokenRow(
                  'textAccent',
                  AppTokensLight.textAccent,
                  AppTokensDark.textAccent,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spacing12),
            _TokenGroup(
              title: 'Surface / BG Tokens',
              surfaceColor: surfaceColor,
              rows: const [
                _TokenRow(
                  'bgPrimary',
                  AppTokensLight.bgPrimary,
                  AppTokensDark.bgPrimary,
                ),
                _TokenRow(
                  'bgSecondary',
                  AppTokensLight.bgSecondary,
                  AppTokensDark.bgSecondary,
                ),
                _TokenRow(
                  'surfaceAccentMain',
                  AppTokensLight.surfaceAccentMain,
                  AppTokensDark.surfaceAccentMain,
                ),
                _TokenRow(
                  'surfaceCriticalMain',
                  AppTokensLight.surfaceCriticalMain,
                  AppTokensDark.surfaceCriticalMain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PaletteGroup extends StatelessWidget {
  const _PaletteGroup({
    required this.title,
    required this.surfaceColor,
    required this.items,
  });

  final String title;
  final Color surfaceColor;
  final List<_PaletteItem> items;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final Color titleColor = isDark
        ? AppTokensDark.textPrimary
        : AppTokensLight.textPrimary;
    final Color metaColor = isDark
        ? AppTokensDark.textSecondary
        : AppTokensLight.textSecondary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(AppSpacing.spacing12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spacing12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.bodyMedium.copyWith(color: titleColor),
            ),
            const SizedBox(height: AppSpacing.spacing8),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.spacing8),
                child: Row(
                  children: [
                    Container(
                      width: AppSpacing.spacing24,
                      height: AppSpacing.spacing24,
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.spacing4,
                        ),
                        border: Border.all(
                          color: isDark
                              ? AppTokensDark.borderSecondary
                              : AppTokensLight.borderSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spacing8),
                    Text(
                      item.name,
                      style: AppTypography.smallMedium.copyWith(
                        color: titleColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _toHex(item.color),
                      style: AppTypography.smallRegular.copyWith(
                        color: metaColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TokenGroup extends StatelessWidget {
  const _TokenGroup({
    required this.title,
    required this.surfaceColor,
    required this.rows,
  });

  final String title;
  final Color surfaceColor;
  final List<_TokenRow> rows;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final Color titleColor = isDark
        ? AppTokensDark.textPrimary
        : AppTokensLight.textPrimary;
    final Color metaColor = isDark
        ? AppTokensDark.textSecondary
        : AppTokensLight.textSecondary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(AppSpacing.spacing12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spacing12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.bodyMedium.copyWith(color: titleColor),
            ),
            const SizedBox(height: AppSpacing.spacing8),
            ...rows.map(
              (row) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.spacing8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 128,
                      child: Text(
                        row.name,
                        style: AppTypography.smallRegular.copyWith(
                          color: metaColor,
                        ),
                      ),
                    ),
                    _swatch(row.light, 'L'),
                    const SizedBox(width: AppSpacing.spacing8),
                    _swatch(row.dark, 'D'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _swatch(Color color, String label) {
    return Row(
      children: [
        Container(
          width: AppSpacing.spacing20,
          height: AppSpacing.spacing20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSpacing.spacing4),
          ),
        ),
        const SizedBox(width: AppSpacing.spacing4),
        Text(label, style: AppTypography.smallRegular),
      ],
    );
  }
}

class _PaletteItem {
  const _PaletteItem(this.name, this.color);

  final String name;
  final Color color;
}

class _TokenRow {
  const _TokenRow(this.name, this.light, this.dark);

  final String name;
  final Color light;
  final Color dark;
}

String _toHex(Color color) {
  final String value = color
      .toARGB32()
      .toRadixString(16)
      .toUpperCase()
      .padLeft(8, '0');
  return '#$value';
}
