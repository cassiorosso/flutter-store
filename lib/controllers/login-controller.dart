import 'package:flutter_store/interfaces/nodestr-interface.dart';
import 'package:flutter_store/models/customer-model.dart';
import 'package:flutter_store/services/shared-preferences-service.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:get_it/get_it.dart';

class LoginController {

  final _repository = GetIt.I.call<INodeStr>();
  final _sharedRepository = GetIt.I.call<SharedPreferencesService>();
  final _userStore = GetIt.I.call<UserStore>();
  String _email;
  String _password;

  void setEmail(String value) => _email = value;
  void setPassword(String value) => _password = value;

  Future<String> loginUser()async{
    CustomerModel _user = await _repository.loginUser(_email, _password);
    if(_user != null){
      _userStore.updateUser(_user);
      return "OK";
    }
    return null;
  }

  void saveEmail(String savedEmail)async{     //Save email for fast logins in the future 
    if(savedEmail == '' || savedEmail != _email)
   await _sharedRepository.addEmail(_email);
  } 

}