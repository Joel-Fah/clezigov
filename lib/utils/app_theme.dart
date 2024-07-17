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
    appBarTheme: AppBarTheme(
      backgroundColor: scaffoldBgColor,
    ),
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
        disabledBackgroundColor: disabledColor,
        disabledForegroundColor: scaffoldBgColor.withOpacity(0.8),
      ),
    ),
    disabledColor: disabledColor,
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
        disabledForegroundColor: disabledColor,
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
        disabledForegroundColor: disabledColor,
      ),
    ),
    dialogBackgroundColor: scaffoldBgColor,
    dialogTheme: DialogTheme(
      backgroundColor: scaffoldBgColor,
      titleTextStyle: AppTextStyles.h2,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius * 3.5,
      )
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: scaffoldBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: topRadius * 1.75,
      ),
      showDragHandle: true,
      dragHandleColor: Color(0xFF79747E),
      dragHandleSize: Size(48.0, 4.0),
      modalBackgroundColor: scaffoldBgColor,
    ),
    iconTheme: IconThemeData(
      color: darkColor,
    ),
    dividerColor: disabledColor.withOpacity(0.5),
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.center,
      overlayColor: WidgetStateProperty.all(seedColorPalette.shade100),
      labelStyle: AppTextStyles.body.copyWith(
          color: scaffoldBgColor,
      ),
      dividerColor: Colors.transparent,
      dividerHeight: 0.0,
      indicator: BoxDecoration(
        color: seedColor,
        borderRadius: borderRadius * 2,
      ),
      indicatorColor: seedColor,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}
