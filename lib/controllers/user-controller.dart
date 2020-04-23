import 'package:flutter/material.dart';
import 'package:flutter_store/repositories/shared-preferences-repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'user-controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final _repository = GetIt.I.call<SharedPreferencesRepository>();

  @observable
  bool darkTheme = false;

  @observable
  ThemeData themeApp = ThemeData.light();

  @action
  setThemeData(){
    if(!darkTheme){
    darkTheme = true;
    _repository.setDarkTheme(true);  
    themeApp = ThemeData.dark();
    }else{
    darkTheme = false;
    _repository.setDarkTheme(false);
    themeApp = ThemeData.light();
  }}

  _UserControllerBase(){
    getTheme().then((value) => darkTheme = value);
    setThemeData();
  }

  Future<bool> getTheme()async{
    return await _repository.getTheme();
  }
  
}

  class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}