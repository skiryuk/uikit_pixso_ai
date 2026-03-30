import 'package:flutter/painting.dart';

/// Цвета коллекции **Palette** в Pixso (файл `w7AdB6a2ifv7HsFHQ1XSUA`, режим Theme).
///
/// Имена: префикс группы (`black`, `blue`, …) + шкала (`100`…`800`) или `main`,
/// как в переменных `blue/100`, `white/main`.
sealed class AppColors {
  const AppColors._();

  // --- Black (`black/*`) ---

  static const Color blackMain = Color(0xFF08091C);
  static const Color black100 = Color(0x0F08091C);
  static const Color black200 = Color(0x1708091C);
  static const Color black300 = Color(0x2408091C);
  static const Color black400 = Color(0x6608091C);
  static const Color black500 = Color(0x9908091C);
  static const Color black600 = Color(0xE008091C);

  // --- Blue (`blue/*`) ---

  static const Color blueMain = Color(0xFF454DE7);
  static const Color blue100 = Color(0x0D454DE7);
  static const Color blue200 = Color(0x17454DE7);
  static const Color blue300 = Color(0x24454DE7);
  static const Color blue400 = Color(0x66454DE7);
  static const Color blue500 = Color(0x99454DE7);
  static const Color blue600 = Color(0xE0454DE7);
  static const Color blue700 = Color(0xFF3940BF);
  static const Color blue800 = Color(0xFF3036A1);

  // --- Green (`green/*`) ---

  static const Color greenMain = Color(0xFF05B364);
  static const Color green100 = Color(0x0D05B364);
  static const Color green200 = Color(0x1705B364);
  static const Color green300 = Color(0x2405B364);
  static const Color green400 = Color(0x6605B364);
  static const Color green500 = Color(0x9905B364);
  static const Color green600 = Color(0xE005B364);
  static const Color green700 = Color(0xFF048A4E);
  static const Color green800 = Color(0xFF037542);

  // --- Orange (`orange/*`) ---

  static const Color orangeMain = Color(0xFFFF8B00);
  static const Color orange100 = Color(0x0DFF8B00);
  static const Color orange200 = Color(0x17FF8B00);
  static const Color orange300 = Color(0x24FF8B00);
  static const Color orange400 = Color(0x66FF8B00);
  static const Color orange500 = Color(0x99FF8B00);
  static const Color orange600 = Color(0xE0FF8B00);
  static const Color orange700 = Color(0xFFE57F05);
  static const Color orange800 = Color(0xFFCC7104);

  // --- Red (`red/*`) ---

  static const Color redMain = Color(0xFFE53E3E);
  static const Color red100 = Color(0x0DE53E3E);
  static const Color red200 = Color(0x17E53E3E);
  static const Color red300 = Color(0x24E53E3E);
  static const Color red400 = Color(0x66E53E3E);
  static const Color red500 = Color(0x99E53E3E);
  static const Color red600 = Color(0xE0E53E3E);
  static const Color red700 = Color(0xFFC72E2E);
  static const Color red800 = Color(0xFF9E2424);

  // --- White (`white/main`, `white/*`) ---

  static const Color whiteMain = Color(0xFFFFFFFF);
  static const Color white100 = Color(0x0AFFFFFF);
  static const Color white200 = Color(0x14FFFFFF);
  static const Color white300 = Color(0x1FFFFFFF);
  static const Color white400 = Color(0x66FFFFFF);
  static const Color white500 = Color(0x99FFFFFF);
  static const Color white600 = Color(0xE0FFFFFF);
}
