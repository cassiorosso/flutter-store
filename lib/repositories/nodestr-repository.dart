import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/interfaces/nodestr-interface.dart';
import 'package:flutter_store/models/customer-model.dart';
import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/models/product-model.dart';
import 'package:flutter_store/utils/consts.dart';
import 'package:flutter_store/utils/dialog-factory.dart';

class NodeStrRepository implements INodeStr {
  final Dio dio;

  NodeStrRepository(this.dio) {
    dio.options.baseUrl = URL_API;
  }

  @override
  Future<String> createUser(String name, String password, String email) async {
    DialogFactory.showLoadingDialog();
    try {
      await dio.post('/customers',
          data: {'name': name, 'password': password, 'email': email});
      DialogFactory.navigatorKey.currentState.pop();
      return "OK";
    } on DioError catch (error) {
      DialogFactory.navigatorKey.currentState.pop(); //Close loading Dialog
      _handleApiDioErrors(error);
    }
    return null;
  }

  @override
  Future<CustomerModel> loginUser(String email, String password) async {
    DialogFactory.showLoadingDialog();
    try {
      Response response = await dio.post('/customers/authenticate', data: {
        'email': email,
        'password': password,
      });
      DialogFactory.navigatorKey.currentState.pop();
      return CustomerModel(
          email: response.data['data']['email'],
          name: response.data['data']['name'],
          token: response.data['token']);
    } on DioError catch (error) {
      DialogFactory.navigatorKey.currentState.pop();
      _handleApiDioErrors(error);
    }
    return null;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductModel> list = List();
      Response response = await dio.get('/products');
      response.data.forEach((product) {
        list.add(ProductModel.fromJson(product));
      });
      return list;
    } on DioError catch (error) {
      _handleApiDioErrors(error);
    }
    return null;
  }

  @override
  Future<List<OrderModel>> getOrders(String customerToken) async {
    try {
      List<OrderModel> list = List();
      Response response = await dio.get('/orders',
          options: Options(headers: {"x-access-token": customerToken}));
      response.data.forEach((order) {
        list.add(OrderModel.fromJson(order));
      });
      return list;
    } on DioError catch (error) {
      _handleApiDioErrors(error);
    }
    return null;
  }

  @override
  Future<String> makeOrder(OrderModel order, String customerToken) async {
    DialogFactory.showLoadingDialog();
    List<Map<String, dynamic>> xOrder = List();
    order.items.forEach((item) {
      xOrder.add({
        'quantity': item.quantity,
        'price': item.price,
        'product': item.product.id
      });
    });
    try {
      await dio.post('/orders',
          data: {
            "items": xOrder,
            "shipPrice": order.shipPrice,
            "totalPrice": order.totalPrice,
            "paymentMethod": order.paymentMethod
          },
          options: Options(headers: {"x-access-token": customerToken}));
      return "OK";
    } on DioError catch (error) {
      DialogFactory.navigatorKey.currentState.pop();
      _handleApiDioErrors(error);
    }
    return null;
  }

  void _handleApiDioErrors(error) {
    switch (error.type) {
      case DioErrorType.DEFAULT:
        DialogFactory.showAlertDialog(
          content: Text(error.error.toString()),
          title: Text("Error"),
        );
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        DialogFactory.showAlertDialog(
          content: Text("Reiceving Timeout"),
          title: Text("Error"),
        );
        break;
      case DioErrorType.RESPONSE:
        DialogFactory.showAlertDialog(
          content: Text(error.response.data["message"]),
          title: Text("Error"),
        );
        break;
      case DioErrorType.SEND_TIMEOUT:
        DialogFactory.showAlertDialog(
          content: Text("Send Timeout"),
          title: Text("Error"),
        );
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        DialogFactory.showAlertDialog(
          content: Text("Connect Timeout"),
          title: Text("Error"),
        );
        break;
      case DioErrorType.CANCEL:
        DialogFactory.showAlertDialog(
          content: Text("The request was cancelled"),
          title: Text("Error"),
        );
        break;
    }
  }
}
