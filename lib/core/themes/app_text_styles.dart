import 'package:flutter/material.dart';

import 'app_typography.dart';

/// Стили текста (TextStyle) из макета Pixso.
/// Соответствуют локальным стилям Typography (getLocalStyles).
/// Цвет не задан — применяйте токены (AppTokensLight / AppTokensDark) при использовании.
class AppTextStyles {
  AppTextStyles._();

  // --- Заголовки ---
  /// Typography/H1 — Roboto Bold 30, line height 32
  static const TextStyle h1 = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size30,
    fontWeight: AppTypography.weightBold,
    height: 32 / 30,
    letterSpacing: 0,
  );

  /// Typography/H2 — Roboto Bold 24, line height 32
  static const TextStyle h2 = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size24,
    fontWeight: AppTypography.weightBold,
    height: 32 / 24,
    letterSpacing: 0,
  );

  /// Typography/Large — Roboto Medium 22, line height 24
  static const TextStyle large = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size22,
    fontWeight: AppTypography.weightMedium,
    height: 24 / 22,
    letterSpacing: 0,
  );

  // --- Body ---
  /// Typography/Body/Bold — Roboto Bold 18, line height 24
  static const TextStyle bodyBold = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size18,
    fontWeight: AppTypography.weightBold,
    height: 24 / 18,
    letterSpacing: 0,
  );

  /// Typography/Body/Regular — Roboto Regular 18, line height 24
  static const TextStyle bodyRegular = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size18,
    fontWeight: AppTypography.weightRegular,
    height: 24 / 18,
    letterSpacing: 0,
  );

  /// Typography/Body/Medium — Roboto Medium 18, line height 24
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size18,
    fontWeight: AppTypography.weightMedium,
    height: 24 / 18,
    letterSpacing: 0,
  );

  /// Typography/Body/Monospace — Roboto Regular 18, tabular figures
  static const TextStyle bodyMonospace = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size18,
    fontWeight: AppTypography.weightRegular,
    height: 24 / 18,
    letterSpacing: 0,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  // --- Small ---
  /// Typography/Small/Regular — Roboto Regular 14, line height 16
  static const TextStyle smallRegular = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size14,
    fontWeight: AppTypography.weightRegular,
    height: 16 / 14,
    letterSpacing: 0.01,
  );

  /// Typography/Small/Medium — Roboto Medium 14, line height 16
  static const TextStyle smallMedium = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size14,
    fontWeight: AppTypography.weightMedium,
    height: 16 / 14,
    letterSpacing: 0.01,
  );

  /// Typography/Small/Monospace — Roboto Medium 14, tabular figures
  static const TextStyle smallMonospace = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontSize: AppTypography.size14,
    fontWeight: AppTypography.weightMedium,
    height: 16 / 14,
    letterSpacing: 0.01,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}
