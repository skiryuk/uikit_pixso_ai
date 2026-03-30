import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_spacing.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/themes/app_tokens.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

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
                  'Text styles',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceX4),
                child: _Section(
                  title: 'Заголовки',
                  children: [
                    _Sample(
                      label: 'H1',
                      style: AppTextStyles.h1.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Заголовок первого уровня',
                    ),
                    _Sample(
                      label: 'H2',
                      style: AppTextStyles.h2.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Заголовок второго уровня',
                    ),
                    _Sample(
                      label: 'Large',
                      style: AppTextStyles.large.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Крупный подзаголовок',
                    ),
                  ],
                ),
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
                child: Text(
                  'Body',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceX4),
                child: _Section(
                  title: '',
                  children: [
                    _Sample(
                      label: 'Body Bold',
                      style: AppTextStyles.bodyBold.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Основной текст полужирный',
                    ),
                    _Sample(
                      label: 'Body Regular',
                      style: AppTextStyles.bodyRegular.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Основной текст обычный',
                    ),
                    _Sample(
                      label: 'Body Medium',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Основной текст средний',
                    ),
                    _Sample(
                      label: 'Body Monospace',
                      style: AppTextStyles.bodyMonospace.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: '12345 67.89',
                    ),
                  ],
                ),
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
                child: Text(
                  'Small',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceX4),
                child: _Section(
                  title: '',
                  children: [
                    _Sample(
                      label: 'Small Regular',
                      style: AppTextStyles.smallRegular.copyWith(color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary),
                      sample: 'Мелкий текст обычный',
                    ),
                    _Sample(
                      label: 'Small Medium',
                      style: AppTextStyles.smallMedium.copyWith(color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary),
                      sample: 'Мелкий текст средний',
                    ),
                    _Sample(
                      label: 'Small Monospace',
                      style: AppTextStyles.smallMonospace.copyWith(color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary),
                      sample: '00:00 100%',
                    ),
                  ],
                ),
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
                child: Text(
                  'Токены текста',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceX4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TokenRow(
                      label: 'textPrimary',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary),
                      sample: 'Primary',
                    ),
                    _TokenRow(
                      label: 'textSecondary',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textSecondary : AppTokensLight.textSecondary),
                      sample: 'Secondary',
                    ),
                    _TokenRow(
                      label: 'textDisabled',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textDisabled : AppTokensLight.textDisabled),
                      sample: 'Disabled',
                    ),
                    _TokenRow(
                      label: 'textAccent',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textAccent : AppTokensLight.textAccent),
                      sample: 'Accent',
                    ),
                    _TokenRow(
                      label: 'textCritical',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textCritical : AppTokensLight.textCritical),
                      sample: 'Critical',
                    ),
                    _TokenRow(
                      label: 'textSuccess',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textSuccess : AppTokensLight.textSuccess),
                      sample: 'Success',
                    ),
                    _TokenRow(
                      label: 'textCaution',
                      style: AppTextStyles.bodyMedium.copyWith(color: isDark ? AppTokensDark.textCaution : AppTokensLight.textCaution),
                      sample: 'Caution',
                    ),
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

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class _Sample extends StatelessWidget {
  const _Sample({
    required this.label,
    required this.style,
    required this.sample,
  });

  final String label;
  final TextStyle style;
  final String sample;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.spaceX4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.spaceX1),
          Text(sample, style: style),
        ],
      ),
    );
  }
}

class _TokenRow extends StatelessWidget {
  const _TokenRow({
    required this.label,
    required this.style,
    required this.sample,
  });

  final String label;
  final TextStyle style;
  final String sample;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.spaceX3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontFamily: 'monospace',
              ),
            ),
          ),
          Expanded(
            child: Text(sample, style: style),
          ),
        ],
      ),
    );
  }
}
