import 'package:flutter_store/interfaces/nodestr-interface.dart';
import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'orders-controller.g.dart';

class OrdersController = _OrdersControllerBase with _$OrdersController;

abstract class _OrdersControllerBase with Store {
  final _repository = GetIt.I.call<INodeStr>();
  final _user = GetIt.I.call<UserStore>();
  bool isLoading = true;

  @observable
  ObservableList<OrderModel> orders;

  @action
  Future<void> getOrders() async {
    await _repository.getOrders(_user.user.token).then((result) {
      isLoading = false;
      if (result != null)
        orders = result.asObservable();
      else
        orders = null;
    });
  }

  _OrdersControllerBase() {
    getOrders();
  }
}
