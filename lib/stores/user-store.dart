import 'package:flutter_store/models/customer-model.dart';
import 'package:mobx/mobx.dart';
part 'user-store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {

  @observable
  CustomerModel user = CustomerModel();

  @action
  void updateUser(CustomerModel userModel){
    user = userModel;
    //CustomerModel user = CustomerModel(email: email, name: name, token: token);
  }
  
}