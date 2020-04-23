import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/repositories/nodestr-repository.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'orders-controller.g.dart';

class OrdersController = _OrdersControllerBase with _$OrdersController;

abstract class _OrdersControllerBase with Store {
  final _repository = GetIt.I.call<NodeStrRepository>();
  final _user = GetIt.I.call<UserStore>();

  @observable 
  ObservableList<OrderModel> orders = ObservableList();

  @action
  Future<void> getOrders()async{
    await _repository.getOrders(_user.user.token).then((result)=> orders = result.asObservable());
  }

  _OrdersControllerBase(){
    getOrders();
  }
  
}