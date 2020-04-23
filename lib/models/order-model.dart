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

    OrderModel({
        this.status,
        this.id,
        this.customer,
        this.number,
        this.items,
        this.totalPrice,
        this.shipPrice
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        id: json["_id"],
        totalPrice: json["totalPrice"].toDouble(),
        shipPrice: json["shipPrice"].toDouble(),
        customer: CustomerModel.fromJson(json["customer"]),
        number: json["number"],
        items: List<CartModel>.from(json["items"].map((x) => CartModel.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "status": status,
    //     "_id": id,
    //     "customer": customer.toJson(),
    //     "number": number,
    //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
    // };
}