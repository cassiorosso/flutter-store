// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentController on _PaymentControllerBase, Store {
  final _$paymentMethodAtom =
      Atom(name: '_PaymentControllerBase.paymentMethod');

  @override
  String get paymentMethod {
    _$paymentMethodAtom.context.enforceReadPolicy(_$paymentMethodAtom);
    _$paymentMethodAtom.reportObserved();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(String value) {
    _$paymentMethodAtom.context.conditionallyRunInAction(() {
      super.paymentMethod = value;
      _$paymentMethodAtom.reportChanged();
    }, _$paymentMethodAtom, name: '${_$paymentMethodAtom.name}_set');
  }

  final _$_PaymentControllerBaseActionController =
      ActionController(name: '_PaymentControllerBase');

  @override
  void choosePayment(int i) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction();
    try {
      return super.choosePayment(i);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'paymentMethod: ${paymentMethod.toString()}';
    return '{$string}';
  }
}
