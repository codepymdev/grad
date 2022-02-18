import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const THEME_STATUS = "APP_THEME";

  setDarkTheme(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(THEME_STATUS, value);
  }

  Future<int> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(THEME_STATUS);
    return value ?? 0;
  }
}
