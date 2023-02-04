import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    useMaterial3: true,
    colorScheme: buildLightColorScheme(),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
      modalElevation: 0,
      elevation: 0,
    ),
    textTheme: _buildLightTextTheme(base.textTheme),
    scaffoldBackgroundColor: AppColors.white,
  );
}

// ThemeData buildDarkTheme() {
//   final base = ThemeData.dark();
//   return base.copyWith(
//     useMaterial3: true,
//     colorScheme: buildDarkColorScheme(),
//     textTheme: _buildDarkTextTheme(base.textTheme),
//     bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: Colors.transparent,
//       modalBackgroundColor: Colors.transparent,
//       modalElevation: 0,
//       elevation: 0,
//     ),
//     scaffoldBackgroundColor: AppColors.black900,
//   );
// }

TextTheme _buildLightTextTheme(TextTheme base) {
  return base.copyWith(
    headlineLarge: GoogleFonts.manrope(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 26,
      letterSpacing: 0.4,
    ),

    // home titles
    headlineMedium: GoogleFonts.manrope(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: 0.4,
      height: 0.9,
      color: AppColors.black900,
    ),

    // home ui welcome subtitle
    headlineSmall: GoogleFonts.manrope(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.27,
      color: AppColors.darkGrey,
    ),

    //for logo and in signin screen
    titleLarge: GoogleFonts.manrope(
      fontWeight: FontWeight.w900,
      fontSize: 24,
      letterSpacing: 0.18,
      // color: AppColors.white,
    ),

    // for small logo
    titleMedium: GoogleFonts.manrope(
      fontWeight: FontWeight.w900,
      fontSize: 20,
      letterSpacing: -0.04,
      color: AppColors.black900,
    ),

    // home ui welcome title
    titleSmall: GoogleFonts.manrope(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      letterSpacing: -0.04,
      color: AppColors.black900,
    ),

    // used in body
    bodyLarge: GoogleFonts.manrope(
      fontWeight: FontWeight.w400,
      color: AppColors.darkGrey,
      fontSize: 18,
      letterSpacing: 0.01,
    ),

    //used in signin last row
    bodyMedium: GoogleFonts.manrope(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.1,
      color: AppColors.darkGrey,
    ),

    //for form hint text
    bodySmall: GoogleFonts.manrope(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      letterSpacing: 0.2,
    ),

    // for text buttons
    labelMedium: GoogleFonts.manrope(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),

    //for elevated buttons
    labelSmall: GoogleFonts.manrope(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.1,
    ),
  );
}

// TextTheme _buildDarkTextTheme(TextTheme base) {
//   return base.copyWith(
//     headlineMedium: GoogleFonts.manrope(
//       fontWeight: FontWeight.w600,
//       fontSize: 34,
//       letterSpacing: 0.4,
//       height: 0.9,
//       color: AppColors.white,
//     ),
//     headlineSmall: GoogleFonts.manrope(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       letterSpacing: 0.27,
//       color: AppColors.white,
//     ),
//     titleLarge: GoogleFonts.manrope(
//       fontWeight: FontWeight.w600,
//       fontSize: 20,
//       letterSpacing: 0.18,
//       color: AppColors.white,
//     ),
//     titleSmall: GoogleFonts.manrope(
//       fontWeight: FontWeight.w600,
//       fontSize: 14,
//       letterSpacing: -0.04,
//       color: AppColors.white,
//     ),
//     bodyLarge: GoogleFonts.manrope(
//       fontWeight: FontWeight.normal,
//       fontSize: 18,
//       letterSpacing: 0.2,
//       color: AppColors.white,
//     ),
//     bodyMedium: GoogleFonts.manrope(
//       fontWeight: FontWeight.normal,
//       fontSize: 14,
//       letterSpacing: -0.05,
//       color: AppColors.white,
//     ),
//     bodySmall: GoogleFonts.manrope(
//       fontWeight: FontWeight.normal,
//       fontSize: 12,
//       letterSpacing: 0.2,
//       color: AppColors.white,
//     ),
//   );
// }
