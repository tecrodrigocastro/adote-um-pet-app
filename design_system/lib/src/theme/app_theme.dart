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
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      labelLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryColor,
      ),
      labelMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      labelSmall: GoogleFonts.mulish(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryColor,
      ),
      titleMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        color: AppColors.secondaryColor,
      ),
      titleSmall: GoogleFonts.mulish(
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
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
      displayLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        color: AppColors.whiteColor,
        fontSize: 140,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w300,
        color: AppColors.secondaryColor,
        fontStyle: FontStyle.italic,
      ),
      headlineMedium: GoogleFonts.sourceSans3(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.secondaryColor,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
