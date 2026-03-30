import 'package:flutter/cupertino.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Text(
          'Buttons',
        ),
      ),
    );
  }
}
