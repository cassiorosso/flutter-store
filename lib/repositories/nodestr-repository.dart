import 'package:dio/dio.dart';
import 'package:flutter_store/models/customer-model.dart';
import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/models/product-model.dart';
import 'package:flutter_store/utils/consts.dart';

class NodeStrRepository {
  final Dio dio;

  NodeStrRepository(this.dio) {
    dio.options.baseUrl = URL_API;
  }

  Future<String> createUser(String name, String password, String email) async {
    try {
      await dio.post('/customers',
          data: {'name': name, 'password': password, 'email': email});
    } on DioError catch (e) {
      return e.response.toString();
    }
    return "OK";
  }

  Future<CustomerModel> loginUser(String email, String password) async {
    try {
      Response response = await dio.post('/customers/authenticate', data: {
        'email': email,
        'password': password,
      });
      return CustomerModel(
          email: response.data['data']['email'],
          name: response.data['data']['name'],
          token: response.data['token']);
    } on DioError catch (e) {
      return CustomerModel(
          email: e.response.toString(),
          name: 'error',
          token: e.message.toString());
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductModel> list = List();
      Response response = await dio.get('/products');
      response.data.forEach((product) {
        list.add(ProductModel.fromJson(product));
      });
      return list;
    } on DioError catch (e) {
      print(e.response.toString());
      return null;
    }
  }

  Future<List<OrderModel>> getOrders(String customerToken) async {
    try {
      List<OrderModel> list = List();
      Response response = await dio.get('/orders',
          options: Options(headers: {"x-access-token": customerToken}));
          print(response.data);
      response.data.forEach((order) {
        list.add(OrderModel.fromJson(order));
      });
      return list;
    } on DioError catch (e) {
      print(e.response.toString());
      return null;
    }
  }

  Future<String> makeOrder(OrderModel order, String customerToken) async {
    List<Map<String, dynamic>> xOrder = List();
    order.items.forEach((item) {
      xOrder.add({
        'quantity': item.quantity,
        'price': item.price,
        'product': item.product.id
      });
    });
    print(order.items[0].price);
    try {
      await dio.post('/orders',
          data: {
            "items": xOrder,
            "shipPrice": order.shipPrice,
            "totalPrice": order.totalPrice
          },
          options: Options(headers: {"x-access-token": customerToken}));
      return "OK";
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }
}
