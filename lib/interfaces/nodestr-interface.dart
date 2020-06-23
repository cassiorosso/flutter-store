import 'package:flutter_store/models/customer-model.dart';
import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/models/product-model.dart';

abstract class INodeStr{

Future<String> createUser(String name, String password, String email);
Future<CustomerModel> loginUser(String email, String password);
Future<List<ProductModel>> getProducts();
Future<List<OrderModel>> getOrders(String customerToken);
Future<String> makeOrder(OrderModel order, String customerToken);

}