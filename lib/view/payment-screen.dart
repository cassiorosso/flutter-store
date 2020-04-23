import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/controllers/cart-controller.dart';
import 'package:flutter_store/controllers/orders-controller.dart';
import 'package:flutter_store/controllers/payment-controller.dart';
import 'package:flutter_store/view/widgets/custom-bottom.dart';
import 'package:flutter_store/view/widgets/custom-dialogs.dart';
import 'package:get_it/get_it.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _dialogs = CustomDialogs();
  final _controller = PaymentController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottom(
         leftColor: Colors.blueGrey,
         leftText: '',
         rightColor: Colors.red[600],
         rightText: 'Confirm Order',
         icon: Icon(Icons.check_circle_outline, color: Colors.white, size: 30,),
         onTap: _controller.paymentMethod == "null"
                    ? null
                    : () async {
                        if (_formKey.currentState.validate()) {
                          _dialogs.showLoadingDialog(context);
                          final _cartController =
                              GetIt.I.call<CartController>();
                          String orderResult =
                              await _cartController.finishOrder();
                          Navigator.pop(context);
                          if (orderResult != "OK")
                            _dialogs.showMessageDialog(
                                context, "Error to execute order", orderResult);
                          else {
                            final _cartController =
                                GetIt.I.call<CartController>();
                            final _ordersController =
                                GetIt.I.call<OrdersController>();
                            _cartController.cleanCart();    
                            _ordersController.getOrders();
                            Navigator.pushReplacementNamed(
                                context, "/confirmedOrder");
                          }
                        } else
                          return null;
                    },
       ),
      appBar: AppBar(title: Text("Payment")),
      body: Observer(builder: (_) {
        return ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Text("Please choose your payment type:\n",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.blueGrey)),
            checkBox(" Money", "money",
                Icon(Icons.monetization_on, color: Colors.green), 0),
            checkBox(" Credit Card", "card",
                Icon(Icons.credit_card, color: Colors.blueGrey), 1),
            checkBox(" Pick up store", "pick",
                Icon(Icons.store, color: Colors.pinkAccent), 2),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            paymentCard(_controller.paymentMethod),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        );
      }),
    );
  }

  Widget checkBox(String title, String value, Icon icon, int i) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(5)),
      child: CheckboxListTile(
        value: (_controller.paymentMethod == value),
        onChanged: (check) {
          if (check == true)
            _controller.choosePayment(i);
          else {
            _controller.choosePayment(3);
          }
        },
        title: Row(children: <Widget>[
          icon,
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.blue[800]),
          )
        ]),
      ),
    );
  }

  Widget paymentCard(String value) {
    switch (value) {
      case "money":
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  "Change for?\n",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (text) {
                      if (text.isEmpty || text == null)
                        return "Please type required text";
                      return null;
                    },
                    autofocus: true,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                    decoration: InputDecoration(
                        prefixText: "\$ ",
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case "card":
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  "What's your credit card flag?\n",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (text) {
                      if (text.isEmpty || text == null)
                        return "Please enter with your card's flag";
                      return null;
                    },
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: Colors.black45,
                        ),
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case "pick":
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Store Address", style: TextStyle(fontSize: 20)),
                Icon(
                  Icons.map,
                  size: 40,
                  color: Colors.pinkAccent,
                ),
                Text(
                  "Pick product at Bordeleoux Avenue, 35, California",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
        break;
      default:
        return Text("");
    }
  }
}
