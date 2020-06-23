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
        bool isLoading = _controller.isLoading;
        if (_controller.orders == null && isLoading == true)
          return Center(child: CircularProgressIndicator());
        else if (orders == null && isLoading == false)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/wrong-connection.jpg",
                fit: BoxFit.cover,
                scale: .5,
              ),
              IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _controller.getOrders();
                  }),
              Text(
                "Refresh",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ); // Melhorar Layout
        else if (orders.isEmpty && isLoading == false)
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/empty-orders.png",
                fit: BoxFit.fill,
                // scale: 1,
              ),
              Text(
                "You don't have any orders yet",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.green[800],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )
            ],
          );
        else
          return ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  order: orders[index],
                );
              });
      }),
    );
  }
}
