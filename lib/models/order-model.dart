import 'package:flutter_store/models/cart-model.dart';
import 'package:flutter_store/models/customer-model.dart';

class OrderModel {
    String status;
    String id;
    CustomerModel customer;
    String number;
    List<CartModel> items;
    double totalPrice;
    double shipPrice;
    String paymentMethod;

    OrderModel({
        this.status,
        this.id,
        this.customer,
        this.number,
        this.items,
        this.totalPrice,
        this.shipPrice,
        this.paymentMethod
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        id: json["_id"],
        totalPrice: json["totalPrice"].toDouble(),
        shipPrice: json["shipPrice"].toDouble(),
        customer: CustomerModel.fromJson(json["customer"]),
        number: json["number"],
        paymentMethod: json["paymentMethod"]?? "money",
        items: List<CartModel>.from(json["items"].map((x) => CartModel.fromJson(x))),
    );

}