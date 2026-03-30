import 'package:flutter/cupertino.dart';
import '../typography/typography.dart';
import '../palette/palette.dart';
import '../buttons/buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.textformat),
            label: 'Typography',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.paintbrush),
            label: 'Palette',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_fill_on_square_fill),
            label: 'Buttons',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const TypographyPage();
          case 1:
            return const PalettePage();
          case 2:
            return const ButtonsPage();
          default:
            return const TypographyPage();
        }
      },
    );
  }
}
