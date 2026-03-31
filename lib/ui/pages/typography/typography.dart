import 'package:flutter/cupertino.dart';

import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/app_tokens.dart';
import '../../../core/themes/app_typography.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

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
              'Typography',
              style: AppTypography.h2.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.spacing8),
            Text(
              'Примеры текстовых стилей из дизайн-токенов',
              style: AppTypography.smallRegular.copyWith(color: secondaryColor),
            ),
            const SizedBox(height: AppSpacing.spacing16),
            _StylePreviewCard(
              title: 'Headings',
              surfaceColor: surfaceColor,
              children: [
                _StyleLine(
                  name: 'h1',
                  style: AppTypography.h1.copyWith(color: textColor),
                  sample: 'Display heading',
                ),
                _StyleLine(
                  name: 'h2',
                  style: AppTypography.h2.copyWith(color: textColor),
                  sample: 'Section heading',
                ),
                _StyleLine(
                  name: 'large',
                  style: AppTypography.large.copyWith(color: textColor),
                  sample: 'Large title',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spacing12),
            _StylePreviewCard(
              title: 'Body',
              surfaceColor: surfaceColor,
              children: [
                _StyleLine(
                  name: 'bodyRegular',
                  style: AppTypography.bodyRegular.copyWith(color: textColor),
                  sample: 'Основной текст интерфейса',
                ),
                _StyleLine(
                  name: 'bodyMedium',
                  style: AppTypography.bodyMedium.copyWith(color: textColor),
                  sample: 'Основной текст (medium)',
                ),
                _StyleLine(
                  name: 'bodyBold',
                  style: AppTypography.bodyBold.copyWith(color: textColor),
                  sample: 'Основной текст (bold)',
                ),
                _StyleLine(
                  name: 'bodyMonospace',
                  style: AppTypography.bodyMonospace.copyWith(color: textColor),
                  sample: '123 456 789',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spacing12),
            _StylePreviewCard(
              title: 'Small',
              surfaceColor: surfaceColor,
              children: [
                _StyleLine(
                  name: 'smallRegular',
                  style: AppTypography.smallRegular.copyWith(color: textColor),
                  sample: 'Вторичный текст',
                ),
                _StyleLine(
                  name: 'smallMedium',
                  style: AppTypography.smallMedium.copyWith(color: textColor),
                  sample: 'Вторичный текст (medium)',
                ),
                _StyleLine(
                  name: 'smallMonospace',
                  style: AppTypography.smallMonospace.copyWith(
                    color: textColor,
                  ),
                  sample: '00:12:45',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StylePreviewCard extends StatelessWidget {
  const _StylePreviewCard({
    required this.title,
    required this.surfaceColor,
    required this.children,
  });

  final String title;
  final Color surfaceColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final Color titleColor = isDark
        ? AppTokensDark.textPrimary
        : AppTokensLight.textPrimary;

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
            ...children,
          ],
        ),
      ),
    );
  }
}

class _StyleLine extends StatelessWidget {
  const _StyleLine({
    required this.name,
    required this.style,
    required this.sample,
  });

  final String name;
  final TextStyle style;
  final String sample;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final Color metaColor = isDark
        ? AppTokensDark.textSecondary
        : AppTokensLight.textSecondary;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.spacing8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTypography.smallMedium.copyWith(color: metaColor),
          ),
          const SizedBox(height: AppSpacing.spacing4),
          Text(sample, style: style),
        ],
      ),
    );
  }
}
