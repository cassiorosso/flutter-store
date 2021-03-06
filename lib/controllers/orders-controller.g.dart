// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersController on _OrdersControllerBase, Store {
  final _$ordersAtom = Atom(name: '_OrdersControllerBase.orders');

  @override
  ObservableList<OrderModel> get orders {
    _$ordersAtom.context.enforceReadPolicy(_$ordersAtom);
    _$ordersAtom.reportObserved();
    return super.orders;
  }

  @override
  set orders(ObservableList<OrderModel> value) {
    _$ordersAtom.context.conditionallyRunInAction(() {
      super.orders = value;
      _$ordersAtom.reportChanged();
    }, _$ordersAtom, name: '${_$ordersAtom.name}_set');
  }

  final _$getOrdersAsyncAction = AsyncAction('getOrders');

  @override
  Future<void> getOrders() {
    return _$getOrdersAsyncAction.run(() => super.getOrders());
  }

  @override
  String toString() {
    final string = 'orders: ${orders.toString()}';
    return '{$string}';
  }
}
