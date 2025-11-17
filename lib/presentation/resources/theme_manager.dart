import 'package:flutter/material.dart';
import 'package:easy_logistics/presentation/resources/color_manager.dart';
import 'package:easy_logistics/presentation/resources/font_manager.dart';
import 'package:easy_logistics/presentation/resources/size_manager.dart';
import 'package:easy_logistics/presentation/resources/styles_manager.dart';
import 'package:easy_logistics/presentation/resources/values_manager.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    // Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    scaffoldBackgroundColor: ColorManager.backGroundColor,
    cardColor: Colors.grey.shade200,
    disabledColor: ColorManager.lightInactive,
    splashColor: ColorManager.formBg,

    // Card Theme
    cardTheme: CardThemeData(
      color: ColorManager.white,
      shadowColor: ColorManager.lightBorder,
      elevation: AppSize.s4,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      // color: ColorManager.containerBoxColor,
      color: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      titleTextStyle: getRegularStyle(
        color: ColorManager.primaryTextDark,
        fontSize: FontSize.s16,
      ),
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: ColorManager.lightInactive,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.black,
        backgroundColor: Colors.blue, // Text color
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 35.0,
        ), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManager.primary,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.primaryTextLight,
        fontSize: FontSize.s24,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.secondaryTextLight,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.secondaryTextLight,
        fontSize: FontSize.s16,
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getLightStyle(color: ColorManager.primaryTextLight),
      labelStyle: getMediumStyle(color: ColorManager.secondaryTextLight),
      errorStyle: getRegularStyle(color: ColorManager.errorRed),
      prefixIconColor: ColorManager.darkInactive,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.lightBorder, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black, // Icon color for light theme
    ),

    //bottom navbar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.darkInactive,
      backgroundColor: ColorManager.backGroundColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),

    //chips
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey.shade200,
      selectedColor: ColorManager.primaryLight, // Color for selected chips
      disabledColor: Colors.grey.shade400,
      selectedShadowColor: ColorManager.primaryLight,
      secondarySelectedColor: Colors.green,
      labelStyle: const TextStyle(
        color: Colors.black, // Text color for light theme
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.secondary,
      onSecondary: ColorManager.white,
      error: ColorManager.errorRed,
      onError: ColorManager.white,
      background: ColorManager.white,
      onBackground: ColorManager.primaryTextLight,
      surface: ColorManager.white,
      onSurface: ColorManager.primaryTextLight,
    ),

    // Search Bar
    searchBarTheme: SearchBarThemeData(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: WidgetStatePropertyAll(null),
      backgroundColor: WidgetStatePropertyAll(null),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          color: ColorManager.darkBorder,
          fontSize: FontSize.s10, // optional
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color: ColorManager.lightBorder, // ✅ custom border color
            width: 0.4, // ✅ 0.2 width
          ),
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        getMediumStyle(
          color: ColorManager.darkBorder,
          fontSize: FontSize.s12,
        ),
      ),
    ),

    // Drawer 
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorManager.white,
      shadowColor: Colors.transparent,
      surfaceTintColor: ColorManager.accentYellow,
      width: 250,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
      ),
    ),

    // ListTiles 
    listTileTheme: ListTileThemeData(
      iconColor: ColorManager.buttonColor,
      textColor: ColorManager.black,
      selectedColor: Colors.deepPurpleAccent,
      selectedTileColor: Colors.deepPurple.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      titleTextStyle: TextStyle(
        fontSize: SizeManager.separateHeight12,
        fontWeight: FontWeightManager.regular,
        color: ColorManager.accentYellow
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.buttonColor,
    )
  );

 
  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    // Colors
    primaryColor: ColorManager.primaryDark,
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.black,
    scaffoldBackgroundColor: ColorManager.black,
    cardColor: Colors.grey.shade900,
    disabledColor: ColorManager.darkBorder,
    splashColor: ColorManager.primaryDark,

    // Card Theme
    // cardTheme: CardThemeData(
    //   color: ColorManager.darkInactive,
    //   shadowColor: ColorManager.darkBorder,
    //   elevation: AppSize.s4,
    // ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: ColorManager.darkInactive,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryLight,
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManager.primaryLight,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.black,
        backgroundColor: ColorManager.primaryDark, // Text color
        padding: const EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 35.0), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
      ),
    ),
    // Text Theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.primaryTextDark,
        fontSize: FontSize.s24,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.secondaryTextDark,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.secondaryTextDark,
        fontSize: FontSize.s20,
      ),
    ),

    iconTheme: const IconThemeData(
      color: Colors.white, // Icon color for dark theme
    ),
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.darkInactive),
      labelStyle: getMediumStyle(color: ColorManager.secondaryTextDark),
      prefixIconColor: ColorManager.lightInactive,
      errorStyle: getRegularStyle(color: ColorManager.errorRed),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.darkBorder, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),

    // bottom navbar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.darkInactive,
      backgroundColor: ColorManager.black,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),

    //chips
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey.shade800,
      selectedColor: ColorManager.primaryDark, // Color for selected chips
      disabledColor: Colors.grey.shade600,
      selectedShadowColor: ColorManager.primaryDark,
      secondarySelectedColor: Colors.green,
      labelStyle: const TextStyle(
        color: Colors.white, // Text color for dark theme
        fontSize: 16,
      ),
      secondaryLabelStyle: TextStyle(
        color: Colors.grey.shade300, // Secondary text color
      ),
      // Add additional properties as needed
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorManager.primaryDark,
      onPrimary: ColorManager.primaryTextDark,
      secondary: ColorManager.secondary,
      onSecondary: ColorManager.primaryTextDark,
      error: ColorManager.errorRed,
      onError: ColorManager.white,
      background: ColorManager.black,
      onBackground: ColorManager.primaryTextDark,
      surface: ColorManager.darkInactive,
      onSurface: ColorManager.primaryTextDark,
    ),
  );
}
