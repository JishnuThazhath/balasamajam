import 'package:shared_preferences/shared_preferences.dart';

class SharedState {
  static SharedPreferences? preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> getSharedState(String key) async {
    if (preferences == null) {
      await init();
    }
    String? value = preferences?.getString(key);

    return value;
  }

  static Future<void> putIsLoggedInState(String key, bool value) async {
    if (preferences == null) {
      await init();
    }
    preferences?.setBool(key, value);
  }

  static Future<void> saveLoginToken(String key, String value) async {
    if (preferences == null) {
      await init();
    }
    preferences?.setString(key, value);
  }
}
