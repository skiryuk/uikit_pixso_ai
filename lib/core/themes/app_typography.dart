import 'package:flutter/cupertino.dart';

/// Типографика из коллекции **Typography** Pixso
/// (файл `w7AdB6a2ifv7HsFHQ1XSUA`).
///
/// Основана на переменных:
/// - `Fonts/Sans` → `Roboto`
/// - `Weight/{Regular,Medium,Bold}`
/// - `Sizes/{10,12,14,16,18,20,22,24,26,28,30,32}`
///
/// Использование:
/// - токены: `AppTypography.fontSize16`, `AppTypography.weightMedium`
/// - готовые стили: `AppTypography.h1`, `AppTypography.bodyRegular` и т.п.
sealed class AppTypography {
  const AppTypography._();

  // ---- Базовые токены ----

  /// Базовое семейство шрифтов (Fonts/Sans).
  static const String fontFamilySans = 'Roboto';

  /// Weight/Regular.
  static const FontWeight weightRegular = FontWeight.w400;

  /// Weight/Medium.
  static const FontWeight weightMedium = FontWeight.w500;

  /// Weight/Bold.
  static const FontWeight weightBold = FontWeight.w700;

  /// Sizes/*
  static const double fontSize10 = 10;
  static const double fontSize12 = 12;
  static const double fontSize14 = 14;
  static const double fontSize16 = 16;
  static const double fontSize18 = 18;
  static const double fontSize20 = 20;
  static const double fontSize22 = 22;
  static const double fontSize24 = 24;
  static const double fontSize26 = 26;
  static const double fontSize28 = 28;
  static const double fontSize30 = 30;
  static const double fontSize32 = 32;

  // ---- Готовые стили (по локальным стилям Typography/*) ----

  /// Typography/H1
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize30,
    fontWeight: weightBold,
    height: 32 / 30,
  );

  /// Typography/H2
  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize24,
    fontWeight: weightBold,
    height: 32 / 24,
  );

  /// Typography/Large
  static const TextStyle large = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: 22,
    fontWeight: weightMedium,
    height: 24 / 22,
  );

  /// Typography/Body/Regular
  static const TextStyle bodyRegular = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize18,
    fontWeight: weightRegular,
    height: 24 / 18,
  );

  /// Typography/Body/Medium
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize18,
    fontWeight: weightMedium,
    height: 24 / 18,
  );

  /// Typography/Body/Bold
  static const TextStyle bodyBold = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize18,
    fontWeight: weightBold,
    height: 24 / 18,
  );

  /// Typography/Body/Monospace
  ///
  /// В Pixso тот же размер/интерлиньяж, но с включёнными `lnum/tnum`.
  /// Для Flutter это просто base-body стиль; моноширинный шрифт можно
  /// навесить поверх при необходимости.
  static const TextStyle bodyMonospace = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize18,
    fontWeight: weightRegular,
    height: 24 / 18,
  );

  /// Typography/Small/Regular
  static const TextStyle smallRegular = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize14,
    fontWeight: weightRegular,
    height: 16 / 14,
    letterSpacing: 0.01,
  );

  /// Typography/Small/Medium
  static const TextStyle smallMedium = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize14,
    fontWeight: weightMedium,
    height: 16 / 14,
    letterSpacing: 0.01,
  );

  /// Typography/Small/Monospace
  static const TextStyle smallMonospace = TextStyle(
    fontFamily: fontFamilySans,
    fontSize: fontSize14,
    fontWeight: weightMedium,
    height: 16 / 14,
    letterSpacing: 0.01,
  );
}

