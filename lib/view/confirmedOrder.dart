import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check,
            color: Colors.green,
            size: 70,
          ),
          Text(
            "Order Confirmed!\n\nPlease visit Orders page in app for more details\n",
            style: TextStyle(color: Colors.grey[700], fontSize: 20),
            textAlign: TextAlign.center,),
          FlatButton(
              color: Colors.teal,
              shape: RoundedRectangleBorder(),
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
              child: Text("Home", style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.all(8),
              textColor: Colors.white,)
        ],
      ),
    ));
  }
}
