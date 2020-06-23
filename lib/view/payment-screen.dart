import 'package:flutter/material.dart';
import 'package:flutter_store/controllers/cart-controller.dart';
import 'package:flutter_store/controllers/orders-controller.dart';
import 'package:flutter_store/view/widgets/custom-bottom.dart';
import 'package:get_it/get_it.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = "money";
  final List<String> paymentMethods = ["money", "card", "pick"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottom(
        leftColor: Colors.blueGrey,
        leftText: '',
        rightColor: Colors.red[600],
        rightText: 'Confirm Order',
        icon: Icon(
          Icons.check_circle_outline,
          color: Colors.white,
          size: 30,
        ),
        onTap: () async {
                  final _cartController = GetIt.I.call<CartController>();
                  String orderResult = await _cartController.finishOrder(selectedPayment);
                  print(orderResult);
                  if (orderResult == "OK") {
                    final _ordersController = GetIt.I.call<OrdersController>();
                    _cartController.cleanCart();
                    _ordersController.getOrders();
                    Navigator.pushNamedAndRemoveUntil(context, "/confirmedOrder",(Route<dynamic> route) => false,);
                  }
              },
      ),
      appBar: AppBar(title: Text("Payment")),
      body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Text("SELECT PAYMENT METHOD\n",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.black54)),
            checkBox(
                "Money",
                paymentMethods[0],
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Image.asset("images/money-icon.png",
                        fit: BoxFit.contain))),
            checkBox(
                "Credit Card",
                paymentMethods[1],
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Image.asset("images/card-icon.png",
                        fit: BoxFit.contain))),
            checkBox(
              "Pick up store",
              paymentMethods[2],
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset(
                    "images/store-icon.png",
                    fit: BoxFit.scaleDown,
                    scale: 15,
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Visibility(
                visible: (selectedPayment == paymentMethods[2]),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Store Address\n",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      Image.asset(
                        "images/store-icon.png",
                        fit: BoxFit.contain,
                        scale: 10,
                      ),
                      Text(
                        "\nPick product at Bordeleoux Avenue, 35, California",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ))
          ],
        )
    );
  }

  Widget checkBox(String title, String value, Widget icon) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: RadioListTile<String>(
          value: value,
          secondary: icon,
          onChanged: (_) {
            setState(() {
              selectedPayment = value;
            });
          },
          title: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
          groupValue: selectedPayment,
        ),
      ),
    );
  }
}
