import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const themestatus = "APP_THEME";

  setDarkTheme(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(themestatus, value);
  }

  Future<int> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(themestatus);
    return value ?? 0;
  }
}
