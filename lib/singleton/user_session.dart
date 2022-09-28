import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static Future<void> setSession(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
  }

  static Future<bool> hasSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userToken');
  }

  static Future<String?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  static Future<void> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
