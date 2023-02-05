import 'package:flutter/material.dart';

class AppColors {
  static const orange = Color(0xffFF6B00);
  static const navy = Color(0xff010A5C);

  static const black900 = Color(0xFF000000);
  static const blackGrey = Color(0xFF2D3748);
  static const blackCharcoal = Color(0xFF2B2B2B);

  static const errorLight = Color(0xFFCF7779);
  static const errorDark = Color(0xFFFF4C5D);

  static const green = Color(0xFF33D49D);

  static const white = Color(0xFFFFFFFF);
  static const flashWhite = Color(0xFFEDF2F7);
  static const whiteGrey = Color(0xFFFAFAFA);

  static const blueGrey = Color(0xFFCBD5E0);

  static const lightGrey = Color(0xFFE9E9E9);
  static const darkGrey = Color(0xFF797979);

  static const backgroundGrey = Color.fromARGB(255, 22, 22, 22);

  static const purple = Color(0xFF5C428F);
}

ColorScheme buildLightColorScheme() {
  return const ColorScheme.light(
    primary: AppColors.orange,
    secondary: AppColors.navy,
    error: AppColors.errorLight,
    onError: AppColors.black900,
  );
}

ColorScheme buildDarkColorScheme() {
  return const ColorScheme.dark(
    primary: AppColors.orange,
    secondary: AppColors.navy,
    error: AppColors.errorDark,
    background: AppColors.white,
  );
}
