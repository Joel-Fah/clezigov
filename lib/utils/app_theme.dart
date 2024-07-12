import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    primarySwatch: seedColorPalette,
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBgColor,
    textTheme: GoogleFonts.dmSansTextTheme().apply(
      bodyColor: darkColor,
      displayColor: darkColor,
    ),
    fontFamily: GoogleFonts.dmSans(
      color: darkColor,
      fontSize: 16.0,
      height: 24.0 / 16.0
    ).fontFamily,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius * 2,
          side: BorderSide(
            color: seedColor,
          ),
        ),
        elevation: 0.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius * 2,
          side: BorderSide(
            color: seedColor,
          ),
        ),
        elevation: 0.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        overlayColor: seedColorPalette.shade50,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius * 2,
          side: BorderSide(
            color: Colors.transparent,
          ),
        ),
        elevation: 0.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        overlayColor: seedColorPalette.shade50,
      ),
    ),
  );
}
