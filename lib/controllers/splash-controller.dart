import 'package:flutter_store/services/shared-preferences-service.dart';
import 'package:get_it/get_it.dart';

class SplashController{

  final _sharedRepository = GetIt.I.call<SharedPreferencesService>();
  String savedEmail = '';

  SplashController(){
    verifySavedEmail();
  }

  void verifySavedEmail()async{
    try{
      String email = await _sharedRepository.getSavedEmail();
      if(email == null) return null;
      savedEmail = email;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}
