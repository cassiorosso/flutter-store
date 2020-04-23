import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static const THEME_STATUS = "THEMESTATUS";

  Future<void> addEmail(String email) async {
    SharedPreferences savedEmail = await SharedPreferences.getInstance();
    savedEmail.setString('stringValue', email);
  }

  Future<String> getSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getString('stringValue');
  }

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
