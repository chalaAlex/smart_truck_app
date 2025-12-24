import 'package:flutter/material.dart';

class TAppBarTheme {
  /// Customizable Light Text Theme
  static AppBarTheme appLightBarTheme = AppBarTheme(
    backgroundColor: Colors.white, // use color from Color constants later
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
  );

  /// Customizable dark Text Theme
  static AppBarTheme appDarkBarTheme = AppBarTheme(
    backgroundColor: Colors.black, // use color from Color constants later
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
  );
}
