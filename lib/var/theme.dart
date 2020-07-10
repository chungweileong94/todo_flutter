import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double _radius = 14;
final BorderRadius _borderRadius = BorderRadius.circular(_radius);

ThemeData getTheme(BuildContext context) {
  final TextTheme textTheme =
      GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme);
  final String fontFamily = GoogleFonts.raleway().fontFamily;

  return ThemeData(
    primarySwatch: Colors.deepPurple,
    accentColor: Colors.deepPurpleAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme,
    fontFamily: fontFamily,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: _borderRadius,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
      ),
      textTheme: ButtonTextTheme.primary,
      padding: EdgeInsets.all(12),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: textTheme.apply(bodyColor: Colors.black),
    ),
  );
}
