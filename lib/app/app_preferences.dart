import 'dart:convert';
import 'package:easy_logistics/domain/model/user_model.dart';
import 'package:easy_logistics/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_ONBOARDING_SCREEN = "PREFS_ONBOARDING_SCREEN";
const String PREFS_IS_USER_LOGGED_IN = "PREFS_IS_USER_LOGGED_IN";
const String PREFS_IS_INSTRUCTOR = "PREFS_IS_INSTRUCTOR";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String THEME_KEY = 'THEME_KEY';
const String AGENT_ID = 'AGENT_ID';
const String PREF_KEY_USER_PROFILE = "PREF_KEY_USER_PROFILE";
const String AGENT_ORIGIN = "AGENT_ORIGIN";

class AppPreferences {
  AppPreferences(this._sharedPreferences);
  SharedPreferences _sharedPreferences;

  Future<void> saveAgentId(String id) async {
    await _sharedPreferences.setString(AGENT_ID, id);
  }

  Future<void> saveAgentOrigin(String origin) async {
    await _sharedPreferences.setString(AGENT_ORIGIN, origin);
  }

  Future<String> getOrigin() async {
    return _sharedPreferences.getString(AGENT_ORIGIN) ?? '';
  }

  Future<String?> getAgentId() async {
    return _sharedPreferences.getString(AGENT_ID);
  }

  // Save Agent Prfoile
  Future<void> saveUserProfileData(LoginData userData) async {
    final String jsonString = jsonEncode({
      "id": userData.id,
      "token": userData.token,
      "fullName": userData.fullName,
      "phoneNumber": userData.phoneNumber,
      "email": userData.email,
      "role": userData.role,
      "region": userData.region,
      "wereda": userData.wereda,
      "zone": userData.zone,
    });
    await _sharedPreferences.setString(PREF_KEY_USER_PROFILE, jsonString);
  }

  Future<LoginData?> getUserProfileData() async {
    final String? jsonString =
        _sharedPreferences.getString(PREF_KEY_USER_PROFILE);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return LoginData(
        jsonMap["id"],
        jsonMap["token"],
        jsonMap["fullName"],
        jsonMap["phoneNumber"],
        jsonMap["email"],
        jsonMap["role"],
        jsonMap["region"],
        jsonMap["wereda"],
        jsonMap["zone"],
      );
    }
    return null;
  }

  // Future<void> userProfile(LoginResponse user) async {
  //   final String jsonString = jsonEncode(user.toJson());
  //   await _sharedPreferences.setString(PREF_KEY_USER_PROFILE, jsonString);
  // }

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setOnBoadringScreenViewed() async {
    _sharedPreferences.setBool(PREFS_ONBOARDING_SCREEN, true);
  }

  Future<bool> IsOnBoadringScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_ONBOARDING_SCREEN) ?? false;
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_IS_USER_LOGGED_IN, true);
  }

  Future<void> setIsUserLoggedOut() async {
    await _sharedPreferences.setBool(PREFS_IS_USER_LOGGED_IN, false);
    await _sharedPreferences.remove(PREFS_KEY_TOKEN);
  }

  Future<bool> IsUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> setIsUserInstructor() async {
    _sharedPreferences.setBool(PREFS_IS_INSTRUCTOR, true);
  }

  Future<void> setUserNotInstructor() async {
    await _sharedPreferences.setBool(PREFS_IS_INSTRUCTOR, false);
  }

  Future<bool> IsUserInstructor() async {
    return _sharedPreferences.getBool(PREFS_IS_INSTRUCTOR) ?? false;
  }

  // Token handling
  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  Future<void> clearToken() async {
    await _sharedPreferences.remove(PREFS_KEY_TOKEN);
  }

  Future<void> saveThemeMode(String themeMode) async {
    await _sharedPreferences.setString(THEME_KEY, themeMode);
  }

  Future<String> getThemeMode() async {
    return _sharedPreferences.getString(THEME_KEY) ??
        'light'; // Default to system
  }
}
