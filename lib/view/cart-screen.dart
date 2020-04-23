import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/controllers/cart-controller.dart';
import 'package:flutter_store/view/widgets/cartProduct-tile.dart';
import 'package:flutter_store/view/widgets/custom-bottom.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = GetIt.I.call<CartController>();
    return Scaffold(
      extendBodyBehindAppBar: false,
      bottomNavigationBar: Observer(builder: (_) {
        if (_controller.cart.isEmpty || _controller.cart == null)
          return Container(
            height: 0,
            width: 0,
          );
        else
          return CustomBottom(
              leftColor: Colors.blueGrey,
              rightColor: Colors.red[600],
              leftText:
                  _controller.totalPrice != 0 ? "\$ ${_controller.totalPrice}" : "\$0",
              rightText: "Check  Out",
              icon: Icon(
                Icons.playlist_add_check,
                color: Colors.white,
                size: 30,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/payment");
              });
      }),
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: <Widget>[
                  //Listview de productCardWidget
                  Observer(builder: (_) {
                    if (_controller.cart.isEmpty || _controller.cart == null)
                      return Column(
                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height*0.2),
                          Icon(Icons.remove_shopping_cart, size: 70),
                          Text(
                          "\nYour cart is Empty!",
                          style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        )
                        ],                     
                      );
                    else
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
                                child: Divider(color: Colors.black26),
                              ),
                          shrinkWrap: true,
                          itemCount: _controller.cart.length,
                          itemBuilder: (context, index) => CartProductTile(
                                product: _controller.cart[index],
                                index: index,
                              ));
                  }),
                  Divider(),
                  Observer(builder: (_) {
                    if (_controller.cart.isEmpty || _controller.cart == null)
                      return Container(
                        height: 0,
                        width: 0,
                      );
                    else
                      return Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () => _controller.shippingMethod(true),
                            child: Card(
                              color: _controller.shipPrice == 0
                                  ? Colors.blue[200]
                                  : Colors.grey[100],
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text("FREE\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "Standard shipping\n(3-5 Days)",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _controller.shippingMethod(false),
                            child: Card(
                              color: _controller.shipPrice == 0
                                  ? Colors.grey[100]
                                  : Colors.blueAccent[100],
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "\$10\n",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Express shipping\n(1-3 Days)",
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/home'),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.add_shopping_cart, color: Colors.white),
                                Text("  Continue Shopping", style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          )
                        ],
                      );
                  }),
                  SizedBox(height: 5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
