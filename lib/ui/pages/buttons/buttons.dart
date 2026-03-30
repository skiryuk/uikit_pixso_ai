import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_spacing.dart';
import '../../../ui/widgets/ui_button.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX4,
                  AppSpacing.spaceX2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Кнопки',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spaceX1),
                    Builder(
                      builder: (context) {
                        final isDark = Theme.of(context).brightness == Brightness.dark;
                        return Text(
                          'UiButton: Style (main / minor), Type (accent, neutral, success, critical), Size (s / m), Role (squircle / circle), State (default / hover / disabled).',
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark ? Colors.white54 : Colors.black54,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            _Section(
              title: 'Style: main',
              children: [
                _Row(
                  children: [
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, label: 'Accent', onPressed: () {}),
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.neutral, label: 'Neutral', onPressed: () {}),
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.success, label: 'Success', onPressed: () {}),
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.critical, label: 'Critical', onPressed: () {}),
                  ],
                ),
              ],
            ),
            _Section(
              title: 'Style: minor',
              children: [
                _Row(
                  children: [
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.accent, label: 'Accent', onPressed: () {}),
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.neutral, label: 'Neutral', onPressed: () {}),
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.success, label: 'Success', onPressed: () {}),
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.critical, label: 'Critical', onPressed: () {}),
                  ],
                ),
              ],
            ),
            _Section(
              title: 'Size: s, m',
              children: [
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, size: UiButtonSize.s, label: 'Small', onPressed: () {}),
                const SizedBox(height: AppSpacing.spaceX2),
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, size: UiButtonSize.m, label: 'Medium', onPressed: () {}),
              ],
            ),
            _Section(
              title: 'Role: squircle, circle',
              children: [
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, role: UiButtonRole.squircle, label: 'Squircle', onPressed: () {}),
                const SizedBox(height: AppSpacing.spaceX2),
                Row(
                  children: [
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, role: UiButtonRole.circle, leading: const Icon(Icons.add), onPressed: () {}, isExpanded: false),
                    const SizedBox(width: AppSpacing.spaceX2),
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.accent, role: UiButtonRole.circle, leading: const Icon(Icons.settings), onPressed: () {}, isExpanded: false),
                  ],
                ),
                const SizedBox(height: AppSpacing.spaceX2),
                Text(
                  'Circle с текстом (pill)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white54 : Colors.black45,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceX2),
                Wrap(
                  spacing: AppSpacing.spaceX2,
                  runSpacing: AppSpacing.spaceX2,
                  children: [
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, role: UiButtonRole.circle, label: 'OK', onPressed: () {}, isExpanded: false),
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, role: UiButtonRole.circle, label: 'Готово', onPressed: () {}, isExpanded: false),
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.accent, role: UiButtonRole.circle, label: 'Отмена', onPressed: () {}, isExpanded: false),
                    UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, role: UiButtonRole.circle, label: 'Add', leading: const Icon(Icons.add), onPressed: () {}, isExpanded: false),
                    UiButton(style: UiButtonStyle.minor, type: UiButtonType.neutral, role: UiButtonRole.circle, label: 'Ещё', trailing: const Icon(CupertinoIcons.chevron_down), onPressed: () {}, isExpanded: false),
                  ],
                ),
              ],
            ),
            _Section(
              title: 'State: default, hover, disabled',
              children: [
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, state: UiButtonState.default_, label: 'Default', onPressed: () {}),
                const SizedBox(height: AppSpacing.spaceX2),
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, state: UiButtonState.hover, label: 'Hover', onPressed: () {}),
                const SizedBox(height: AppSpacing.spaceX2),
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, state: UiButtonState.disabled, label: 'Disabled'),
              ],
            ),
            _Section(
              title: 'С иконкой',
              children: [
                UiButton(style: UiButtonStyle.main, type: UiButtonType.accent, label: 'Сохранить', leading: const Icon(Icons.save), onPressed: () {}),
                const SizedBox(height: AppSpacing.spaceX2),
                UiButton(style: UiButtonStyle.minor, type: UiButtonType.accent, label: 'Отмена', trailing: const Icon(CupertinoIcons.xmark), onPressed: () {}),
              ],
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.spaceX4,
          AppSpacing.spaceX4,
          AppSpacing.spaceX4,
          AppSpacing.spaceX2,
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
            ...children,
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.spaceX2),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.spaceX2),
            Expanded(child: children[i]),
          ],
        ],
      ),
    );
  }
}
