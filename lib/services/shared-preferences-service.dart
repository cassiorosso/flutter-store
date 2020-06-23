import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const THEME_STATUS = "THEMESTATUS";

  Future<void> addEmail(String email) async {
    SharedPreferences savedEmail = await SharedPreferences.getInstance();
    savedEmail.setString('stringValue', email);
  }

  Future<String> getSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringValue');
  }

  Future<void> setDarkTheme(bool value) async {  // Dark(true) or ligth(false) mode
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getBool(THEME_STATUS));
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getBool(THEME_STATUS));
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
