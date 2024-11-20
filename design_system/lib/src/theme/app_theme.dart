import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 30,
      ),
    ),
    textTheme: TextTheme(
      labelMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      bodySmall: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    ),
  );
}
