import 'package:flutter_store/repositories/shared-preferences-repository.dart';
import 'package:get_it/get_it.dart';

class SplashController{

  final _sharedRepository = GetIt.I.call<SharedPreferencesRepository>();
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
