import 'package:flutter/material.dart';
import 'package:smart_truck_app/core/resources/string_manager.dart';
import 'package:smart_truck_app/utils/constants/app_colors.dart';
import 'package:smart_truck_app/utils/custom_theme/appBarTheme.dart';
import 'package:smart_truck_app/utils/custom_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: StringManager.fontStyleText,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.appLightBarTheme,
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: StringManager.fontStyleText,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: TTextTheme.darkTextTheme,
  );
}
