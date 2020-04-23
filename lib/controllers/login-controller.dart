import 'package:flutter_store/models/customer-model.dart';
import 'package:flutter_store/repositories/nodestr-repository.dart';
import 'package:flutter_store/repositories/shared-preferences-repository.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:get_it/get_it.dart';

class LoginController {

  final _repository = GetIt.I.call<NodeStrRepository>();
  final _sharedRepository = GetIt.I.call<SharedPreferencesRepository>();
  final _userStore = GetIt.I.call<UserStore>();
  String _email;
  String _password;

  void setEmail(String value) => _email = value;
  void setPassword(String value) => _password = value;

  Future<String> loginUser()async{
    CustomerModel _user = await _repository.loginUser(_email, _password);
    if(_user.name == 'error')
    return _user.email;
    else{
      _userStore.updateUser(_user);
      return "OK";
    }
  }

  void saveEmail(String savedEmail)async{
    if(savedEmail == '' || savedEmail != _email)
   await _sharedRepository.addEmail(_email);
  } 

}