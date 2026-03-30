import 'package:flutter/cupertino.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Text(
          'Text styles',
        ),
      ),
    );
  }
}

