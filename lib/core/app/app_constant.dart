import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static const String baseUrl = "https://easy-logistics-api.onrender.com";
  static String token = ""; 

// -------------- Role selection screen ----------- //
  static const String appName = 'Freight Portal';
  static const String appVersion = '1.0.0';

  static const String fontFamily = 'Inter';

  static const String roleSelectionKey = 'role_selection';
  static const String shipperRoleKey = 'shipper';
  static const String carrierRoleKey = 'carrier';




  // Method to set the token and save it in SharedPreferences
  static Future<void> setToken(String newToken) async {
    token = newToken;
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken);  
  }

  static Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';  // Load the token
  }
}

