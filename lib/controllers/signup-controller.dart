import 'package:flutter_store/interfaces/nodestr-interface.dart';
import 'package:get_it/get_it.dart';

class SignUpController {
  final _repository = GetIt.I.call<INodeStr>();

  String _name;
  String _email;
  String _password;

  void setName(String value) => _name = value;
  void setEmail(String value) => _email = value;
  void onChangePassword(String value) => _password = value;

  String confirmPassword(String pass) {
    if (pass != _password) return "The passwords must match";
    return null;
  }

  Future<String> createUser() async {
    String result = await _repository.createUser(_name, _password, _email);
    return result;
  }
}
