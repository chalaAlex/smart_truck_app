// import 'package:flutter/material.dart';
// import 'app_preferences.dart';

// class ThemeProvider with ChangeNotifier {
//   final AppPreferences _appPreferences;
//   late ThemeMode _themeMode;

//   ThemeProvider(this._appPreferences);

//   ThemeMode get themeMode => _themeMode;

//   // Fetch the current theme from shared preferences
//   Future<void> loadThemeMode() async {
//     String savedTheme = await _appPreferences.getThemeMode('theme');
//     _themeMode = _getThemeModeFromString(savedTheme);
//     notifyListeners();
//   }

//   // Save the selected theme to shared preferences and notify listeners
//   Future<void> setThemeMode(ThemeMode themeMode) async {
//     _themeMode = themeMode;
//     await _appPreferences.saveThemeMode(themeMode.toString());
//     notifyListeners();
//   }

//   // Convert a string to a ThemeMode
//   ThemeMode _getThemeModeFromString(String themeMode) {
//     switch (themeMode) {
//       case 'ThemeMode.light':
//         return ThemeMode.light;
//       case 'ThemeMode.dark':
//         return ThemeMode.dark;
//       default:
//         return ThemeMode.system;
//     }
//   }
// }