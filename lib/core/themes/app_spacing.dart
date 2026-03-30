import 'package:flutter/foundation.dart';

/// Система отступов **Spacing** и **Spacing-Tokens** из Pixso
/// (файл `w7AdB6a2ifv7HsFHQ1XSUA`).
///
/// Базовая шкала (на основе `Spacing`):
/// 0, 4, 8, 10, 12, 16, 20, 24, 28, 32.
///
/// Семантические алиасы (из `Spacing-Tokens`):
/// - `spaceX1` → 4
/// - `spaceX2` → 8
/// - `spaceX3` → 10
/// - `spaceX4` → 12
/// - `spaceX5` → 16
/// - `spaceX6` → 20
@immutable
sealed class AppSpacing {
  const AppSpacing._();

  // --- Базовая шкала Spacing (`9:26`) ---

  static const double spacing0 = 0;
  static const double spacing4 = 4;
  static const double spacing8 = 8;
  static const double spacing10 = 10;
  static const double spacing12 = 12;
  static const double spacing16 = 16;
  static const double spacing20 = 20;
  static const double spacing24 = 24;
  static const double spacing28 = 28;
  static const double spacing32 = 32;

  // --- Семантические токены Spacing-Tokens (`9:36`) ---

  static const double spaceX1 = spacing4; // alias для 4
  static const double spaceX2 = spacing8; // alias для 8
  static const double spaceX3 = spacing10; // alias для 10
  static const double spaceX4 = spacing12; // alias для 12
  static const double spaceX5 = spacing16; // alias для 16
  static const double spaceX6 = spacing20; // alias для 20
}

