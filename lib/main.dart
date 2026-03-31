import 'package:flutter/cupertino.dart';

import 'core/themes/app_theme_provider.dart';
import 'ui/pages/home/home.dart';

void main() {
  runApp(AppThemeScope(notifier: AppThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppThemeProvider themeProvider = AppThemeScope.of(context);
    return CupertinoApp(
      theme: themeProvider.cupertinoTheme,
      home: const HomePage(),
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            child ?? const SizedBox.shrink(),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  onPressed: themeProvider.toggleTheme,
                  child: Icon(
                    themeProvider.isDark
                        ? CupertinoIcons.sun_max
                        : CupertinoIcons.moon,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
