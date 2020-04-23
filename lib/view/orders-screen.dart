import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/controllers/orders-controller.dart';
import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/view/widgets/order-card.dart';
import 'package:get_it/get_it.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = GetIt.I.call<OrdersController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Observer(builder: (_) {
        List<OrderModel> orders = _controller.orders;
        if(orders == null)
        return Center(child: CircularProgressIndicator());
        if(orders.isEmpty)
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.line_style, size: 42),
            Text("You don't have any orders yet", style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600), textAlign: TextAlign.center,)
          ],
        );
        else
        return ListView.builder(
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, index){
            return OrderCard(order: orders[index],);
          });
      }),
    );
  }
}
