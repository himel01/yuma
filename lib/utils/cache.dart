import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<bool> saveUserData(String key, value) async {
    // user
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setStringList(key, value);
  }

  static Future<List<String>> getUserData(String key) async {
    // user
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key) ?? [];
  }
}
