import 'package:flutter/cupertino.dart';
import '../../widgets/ui_button.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _SectionTitle('Main / Accent'),
            _buildPair(
              UiButton(
                label: 'M Default',
                style: UiButtonStyle.main,
                type: UiButtonType.accent,
                onPressed: _noop,
              ),
              UiButton(
                label: 'M Hover',
                style: UiButtonStyle.main,
                type: UiButtonType.accent,
                state: UiButtonState.hover,
                onPressed: _noop,
              ),
            ),
            _buildPair(
              UiButton(
                label: 'S Default',
                size: UiButtonSize.s,
                style: UiButtonStyle.main,
                type: UiButtonType.accent,
                onPressed: _noop,
              ),
              const UiButton(
                label: 'Disabled',
                size: UiButtonSize.s,
                style: UiButtonStyle.main,
                type: UiButtonType.accent,
                onPressed: null,
              ),
            ),
            const SizedBox(height: 16),
            const _SectionTitle('Main / Neutral / Success / Critical'),
            _buildPair(
              UiButton(
                label: 'Neutral',
                style: UiButtonStyle.main,
                type: UiButtonType.neutral,
                leading: const Icon(CupertinoIcons.add),
                onPressed: _noop,
              ),
              UiButton(
                label: 'Success',
                style: UiButtonStyle.main,
                type: UiButtonType.success,
                trailing: const Icon(CupertinoIcons.check_mark),
                onPressed: _noop,
              ),
            ),
            _buildPair(
              UiButton(
                label: 'Critical',
                style: UiButtonStyle.main,
                type: UiButtonType.critical,
                onPressed: _noop,
              ),
              UiButton(
                label: 'Critical Hover',
                style: UiButtonStyle.main,
                type: UiButtonType.critical,
                state: UiButtonState.hover,
                onPressed: _noop,
              ),
            ),
            const SizedBox(height: 16),
            const _SectionTitle('Minor / All Types'),
            _buildPair(
              UiButton(
                label: 'Accent Minor',
                style: UiButtonStyle.minor,
                type: UiButtonType.accent,
                onPressed: _noop,
              ),
              UiButton(
                label: 'Neutral Minor',
                style: UiButtonStyle.minor,
                type: UiButtonType.neutral,
                onPressed: _noop,
              ),
            ),
            _buildPair(
              UiButton(
                label: 'Success Minor',
                style: UiButtonStyle.minor,
                type: UiButtonType.success,
                onPressed: _noop,
              ),
              UiButton(
                label: 'Critical Minor',
                style: UiButtonStyle.minor,
                type: UiButtonType.critical,
                onPressed: _noop,
              ),
            ),
            _buildPair(
              UiButton(
                label: 'Minor Hover',
                style: UiButtonStyle.minor,
                type: UiButtonType.accent,
                state: UiButtonState.hover,
                onPressed: _noop,
              ),
              const UiButton(
                label: 'Minor Disabled',
                style: UiButtonStyle.minor,
                type: UiButtonType.accent,
                onPressed: null,
              ),
            ),
            const SizedBox(height: 16),
            const _SectionTitle('Role: Circle'),
            _buildPair(
              UiButton(
                role: UiButtonRole.circle,
                size: UiButtonSize.m,
                style: UiButtonStyle.main,
                type: UiButtonType.accent,
                leading: const Icon(CupertinoIcons.add),
                onPressed: _noop,
              ),
              UiButton(
                role: UiButtonRole.circle,
                size: UiButtonSize.s,
                style: UiButtonStyle.main,
                type: UiButtonType.success,
                leading: const Icon(CupertinoIcons.check_mark),
                onPressed: _noop,
              ),
            ),
            _buildPair(
              UiButton(
                role: UiButtonRole.circle,
                size: UiButtonSize.m,
                style: UiButtonStyle.minor,
                type: UiButtonType.critical,
                state: UiButtonState.hover,
                leading: const Icon(CupertinoIcons.exclamationmark),
                onPressed: _noop,
              ),
              const UiButton(
                role: UiButtonRole.circle,
                size: UiButtonSize.s,
                style: UiButtonStyle.minor,
                type: UiButtonType.neutral,
                leading: Icon(CupertinoIcons.minus),
                onPressed: null,
              ),
            ),
            const SizedBox(height: 16),
            const _SectionTitle('Expand'),
            UiButton(
              label: 'Full width accent',
              style: UiButtonStyle.main,
              type: UiButtonType.accent,
              expand: true,
              onPressed: _noop,
            ),
            const SizedBox(height: 12),
            UiButton(
              label: 'Full width neutral minor',
              style: UiButtonStyle.minor,
              type: UiButtonType.neutral,
              expand: true,
              onPressed: _noop,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPair(Widget left, Widget right) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 12),
        Expanded(child: right),
      ],
    ),
  );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}

void _noop() {}
