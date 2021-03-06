// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<double> _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice)).value;

  final _$cartAtom = Atom(name: '_CartControllerBase.cart');

  @override
  ObservableList<CartModel> get cart {
    _$cartAtom.context.enforceReadPolicy(_$cartAtom);
    _$cartAtom.reportObserved();
    return super.cart;
  }

  @override
  set cart(ObservableList<CartModel> value) {
    _$cartAtom.context.conditionallyRunInAction(() {
      super.cart = value;
      _$cartAtom.reportChanged();
    }, _$cartAtom, name: '${_$cartAtom.name}_set');
  }

  final _$shipPriceAtom = Atom(name: '_CartControllerBase.shipPrice');

  @override
  double get shipPrice {
    _$shipPriceAtom.context.enforceReadPolicy(_$shipPriceAtom);
    _$shipPriceAtom.reportObserved();
    return super.shipPrice;
  }

  @override
  set shipPrice(double value) {
    _$shipPriceAtom.context.conditionallyRunInAction(() {
      super.shipPrice = value;
      _$shipPriceAtom.reportChanged();
    }, _$shipPriceAtom, name: '${_$shipPriceAtom.name}_set');
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void addCart(ProductModel product) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction();
    try {
      return super.addCart(product);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCart(String id) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction();
    try {
      return super.removeCart(id);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanCart() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction();
    try {
      return super.cleanCart();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProdutcQuantity(int index) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction();
    try {
      return super.addProdutcQuantity(index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProdutcQuantity(int index) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction();
    try {
      return super.removeProdutcQuantity(index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shippingMethod(bool free) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction();
    try {
      return super.shippingMethod(free);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cart: ${cart.toString()},shipPrice: ${shipPrice.toString()},totalPrice: ${totalPrice.toString()}';
    return '{$string}';
  }
}
