import 'package:flutter_store/models/product-model.dart';

class CartModel{

ProductModel product;
int quantity;
var price;

CartModel({this.product, this.quantity,this.price});

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        product: ProductModel.fromJson(json["product"]),
    );

}