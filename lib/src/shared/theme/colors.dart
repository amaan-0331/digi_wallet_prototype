import 'package:flutter/material.dart';

class AppColors {
  static const Color orange = Color(0xffFF6B00);
  static const Color navy = Color(0xff010A5C);

  static const Color black900 = Color(0xFF000000);
  static const Color blackLogo = Color(0xFF2D3748);

  static const Color errorLight = Color(0xFFCF7779);
  static const Color errorDark = Color(0xFFFF4C5D);

  static const Color white = Color(0xFFFFFFFF);

  static const lightGrey = Color(0xFFE9E9E9);

  static const darkGrey = Color(0xFF797979);
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
