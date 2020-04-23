import 'package:flutter/material.dart';
import 'package:flutter_store/models/order-model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/order', arguments: order),
      child: Card(
        margin: EdgeInsets.only(top: 6, left: 8, right: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.local_grocery_store,
                  size: 40,
                  color: Colors.blueGrey,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text("Order Number: ${order.number}",),
                  ),
                  SizedBox(height: 4),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text("\$${order.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  SizedBox(height: 4),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text("Status: ${order.status}",
                        style: TextStyle(
                            color: order.status == "done"
                                ? Colors.green[700]
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
