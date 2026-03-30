import 'package:flutter/cupertino.dart';

class PalettePage extends StatelessWidget {
  const PalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Text(
              'Palette & Tokens',
          ),
        ),
    );
  }
}
