import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final BorderRadius _borderRadius = BorderRadius.circular(10);

ThemeData getTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
      fontFamily: GoogleFonts.rubik().fontFamily,
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
    );
