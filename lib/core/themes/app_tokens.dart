import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Семантические токены из Pixso (Variable Set 4:91).
/// Экспортировано из getVariableSets → agent-tools/*.txt
/// Режимы: Light (4:1), Dark (16:0)

/// Токены для светлой темы
class AppTokensLight {
  AppTokensLight._();

  // --- Border ---
  static const Color borderPrimary = AppColors.black300;
  static const Color borderSecondary = AppColors.black200;

  // --- Text ---
  static const Color textPrimary = AppColors.blackMain;
  static const Color textSecondary = AppColors.black500;
  static const Color textDisabled = AppColors.black400;
  static const Color textAccent = AppColors.blueMain;
  static const Color textCritical = AppColors.red800;
  static const Color textCaution = AppColors.orangeMain;
  static const Color textSuccess = AppColors.green800;
  static const Color textPrimaryInverse = AppColors.whiteMain;
  static const Color textPrimaryOnColor = AppColors.whiteMain;

  // --- Icon ---
  static const Color iconPrimary = AppColors.blackMain;
  static const Color iconSecondary = AppColors.black500;
  static const Color iconDisabled = AppColors.black400;
  static const Color iconAccent = AppColors.blueMain;
  static const Color iconCritical = AppColors.red800;
  static const Color iconCaution = AppColors.orangeMain;
  static const Color iconSuccess = AppColors.green800;
  static const Color iconPrimaryInverse = AppColors.whiteMain;
  static const Color iconPrimaryOnColor = AppColors.whiteMain;

  // --- Background ---
  static const Color bgPrimary = AppColors.whiteMain;
  static const Color bgSecondary = AppColors.black200;
  static const Color bgAccent = AppColors.blueMain;
  static const Color bgPrimaryHover = AppColors.black200;
  static const Color bgPrimaryActive = AppColors.black200;
  static const Color bgSecondaryHover = AppColors.black200;
  static const Color bgSecondaryActive = AppColors.black300;
  static const Color bgAccentHover = AppColors.blue600;
  static const Color bgAccentActive = AppColors.blue800;
  static const Color bgAccentSubdued = AppColors.blue100;
  static const Color bgAccentSubduedHover = AppColors.blue200;
  static const Color bgAccentSubduedActive = AppColors.blue300;
  static const Color bgPrimaryInverse = AppColors.black600;
  static const Color bgSecondaryInverse = AppColors.black500;

  // --- Surface ---
  static const Color surfaceDefault = AppColors.whiteMain;
  static const Color surfaceAccentMain = AppColors.blueMain;
  static const Color surfaceAccentHover = AppColors.blue600;
  static const Color surfaceAccentMedium = AppColors.blue300;
  static const Color surfaceAccentLow = AppColors.blue200;
  static const Color surfaceNeutralLow = AppColors.black200;
  static const Color surfaceNeutralDefault = AppColors.black200;
  static const Color surfaceNeutralMedium = AppColors.black300;
  static const Color surfaceNeutralHigh = AppColors.blackMain;
  static const Color surfaceCriticalMain = AppColors.redMain;
  static const Color surfaceCriticalHover = AppColors.red700;
  static const Color surfaceCriticalMedium = AppColors.red300;
  static const Color surfaceCriticalLow = AppColors.red200;
  static const Color surfaceSuccessMain = AppColors.greenMain;
  static const Color surfaceSuccessHover = AppColors.green700;
  static const Color surfaceSuccessMedium = AppColors.green400;
  static const Color surfaceSuccessLow = AppColors.green200;
}

/// Токены для тёмной темы
class AppTokensDark {
  AppTokensDark._();

  // --- Border ---
  static const Color borderPrimary = AppColors.white600;
  static const Color borderSecondary = AppColors.white200;

  // --- Text ---
  static const Color textPrimary = AppColors.whiteMain;
  static const Color textSecondary = AppColors.white500;
  static const Color textDisabled = AppColors.white300;
  static const Color textAccent = AppColors.blueMain;
  static const Color textCritical = AppColors.red800;
  static const Color textCaution = AppColors.orangeMain;
  static const Color textSuccess = AppColors.green800;
  static const Color textPrimaryInverse = AppColors.blackMain;
  static const Color textPrimaryOnColor = AppColors.whiteMain;

  // --- Icon ---
  static const Color iconPrimary = AppColors.whiteMain;
  static const Color iconSecondary = AppColors.white500;
  static const Color iconDisabled = AppColors.white300;
  static const Color iconAccent = AppColors.blueMain;
  static const Color iconCritical = AppColors.red800;
  static const Color iconCaution = AppColors.orangeMain;
  static const Color iconSuccess = AppColors.green800;
  static const Color iconPrimaryInverse = AppColors.blackMain;
  static const Color iconPrimaryOnColor = AppColors.whiteMain;

  // --- Background ---
  static const Color bgPrimary = AppColors.blackMain;
  static const Color bgSecondary = AppColors.white200;
  static const Color bgAccent = AppColors.blueMain;
  static const Color bgPrimaryHover = AppColors.white200;
  static const Color bgPrimaryActive = AppColors.white200;
  static const Color bgSecondaryHover = AppColors.white600;
  static const Color bgSecondaryActive = AppColors.white200;
  static const Color bgAccentHover = AppColors.blue600;
  static const Color bgAccentActive = AppColors.blue800;
  static const Color bgAccentSubdued = AppColors.blue100;
  static const Color bgAccentSubduedHover = AppColors.blue200;
  static const Color bgAccentSubduedActive = AppColors.blue300;
  static const Color bgPrimaryInverse = AppColors.white100;
  static const Color bgSecondaryInverse = AppColors.white500;

  // --- Surface ---
  static const Color surfaceDefault = AppColors.blackMain;
  static const Color surfaceAccentMain = AppColors.blueMain;
  static const Color surfaceAccentHover = AppColors.blue600;
  static const Color surfaceAccentMedium = AppColors.blue300;
  static const Color surfaceAccentLow = AppColors.blue200;
  static const Color surfaceNeutralLow = AppColors.white200;
  static const Color surfaceNeutralDefault = AppColors.white200;
  static const Color surfaceNeutralMedium = AppColors.white600;
  static const Color surfaceNeutralHigh = AppColors.whiteMain;
  static const Color surfaceCriticalMain = AppColors.redMain;
  static const Color surfaceCriticalHover = AppColors.red700;
  static const Color surfaceCriticalMedium = AppColors.red300;
  static const Color surfaceCriticalLow = AppColors.red200;
  static const Color surfaceSuccessMain = AppColors.greenMain;
  static const Color surfaceSuccessHover = AppColors.green700;
  static const Color surfaceSuccessMedium = AppColors.green400;
  static const Color surfaceSuccessLow = AppColors.green200;
}
