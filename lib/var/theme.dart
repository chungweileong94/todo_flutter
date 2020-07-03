import 'package:flutter/material.dart';

final BorderRadius _borderRadius = BorderRadius.circular(10);

final ThemeData theme = ThemeData(
  primarySwatch: Colors.purple,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: _borderRadius,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: _borderRadius,
    ),
  ),
);
