import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    primarySwatch: primaryPalette,
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBgColor,
    textTheme: GoogleFonts.dmSansTextTheme().apply(
      bodyColor: darkColor,
      displayColor: darkColor,
    ),
    fontFamily: GoogleFonts.dmSans(
      color: darkColor,
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
        padding: EdgeInsets.symmetric(horizontal: 16.0),
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
        padding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    ),
  );
}
