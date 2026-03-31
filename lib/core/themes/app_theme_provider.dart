import 'package:flutter/cupertino.dart';

import 'app_tokens.dart';
import 'app_typography.dart';

enum AppThemeMode { light, dark }

/// Провайдер темы приложения на основе токенов Pixso.
final class AppThemeProvider extends ChangeNotifier {
  AppThemeProvider({AppThemeMode initialMode = AppThemeMode.light})
    : _mode = initialMode;

  AppThemeMode _mode;

  AppThemeMode get mode => _mode;

  bool get isDark => _mode == AppThemeMode.dark;

  void setMode(AppThemeMode mode) {
    if (_mode == mode) {
      return;
    }
    _mode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    setMode(isDark ? AppThemeMode.light : AppThemeMode.dark);
  }

  CupertinoThemeData get cupertinoTheme {
    final Color primaryColor = isDark
        ? AppTokensDark.bgAccent
        : AppTokensLight.bgAccent;
    final Color scaffoldBackgroundColor = isDark
        ? AppTokensDark.bgPrimary
        : AppTokensLight.bgPrimary;
    final Color barBackgroundColor = isDark
        ? AppTokensDark.bgSecondary
        : AppTokensLight.bgSecondary;
    final Color textColor = isDark
        ? AppTokensDark.textPrimary
        : AppTokensLight.textPrimary;

    return CupertinoThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      barBackgroundColor: barBackgroundColor,
      textTheme: CupertinoTextThemeData(
        primaryColor: textColor,
        textStyle: TextStyle(
          color: textColor,
          fontFamily: AppTypography.fontFamilySans,
          fontSize: AppTypography.fontSize16,
          fontWeight: AppTypography.weightRegular,
        ),
      ),
    );
  }
}

/// Inherited-обертка для доступа к [AppThemeProvider] из дерева виджетов.
final class AppThemeScope extends InheritedNotifier<AppThemeProvider> {
  const AppThemeScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static AppThemeProvider of(BuildContext context) {
    final AppThemeScope? scope = context
        .dependOnInheritedWidgetOfExactType<AppThemeScope>();
    assert(scope != null, 'AppThemeScope не найден в дереве виджетов.');
    return scope!.notifier!;
  }
}
