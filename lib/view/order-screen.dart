import 'package:flutter/material.dart';
import 'package:flutter_store/models/cart-model.dart';
import 'package:flutter_store/models/order-model.dart';

class OrderScreen extends StatelessWidget {
  final OrderModel order;
  const OrderScreen({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order details"),
      ),
      body: Card(
          margin: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Order id: ${order.number}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Divider(),
                ListView.separated(
                    shrinkWrap: true,
                    itemCount: order.items.length,
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.grey[500],
                        ),
                    itemBuilder: (context, index) {
                      CartModel product = order.items[index];
                      return Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.grey),
                            ),
                            height: 70,
                            width: 70,
                            child: Center(
                                child: Icon(
                              Icons.pages,
                              color: Colors.green,
                            )),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(product.product.title,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)),
                              Text("\$${product.price.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                              Text("QTY: ${product.quantity.toString()}",
                                  style: TextStyle(fontSize: 15)),
                            ],
                          )
                        ],
                      );
                    }),
                SizedBox(height: 20),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.motorcycle,
                      size: 26,
                    ),
                    Text("  Shipment - ", style: TextStyle(fontSize: 18)),
                    Text(
                      "\$${order.shipPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Divider(),
                SizedBox(height: 20),
                Text(
                  "Total",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                Text("\$${order.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 22,
                        fontWeight: FontWeight.w800))
              ],
            ),
          )),
    );
  }
}
