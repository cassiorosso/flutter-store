import 'package:flutter/material.dart';
import 'package:flutter_store/view/cart-screen.dart';
import 'package:flutter_store/view/orders-screen.dart';
import 'package:flutter_store/view/products-screen.dart';
import 'package:flutter_store/view/user-screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _bottomTabs = [
    ProductsScreen(),
    UserScreen(),
    OrdersScreen(),
    CartScreen(),
  ];
  final TextStyle _textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _bottomTabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Colors.grey[300]),
          unselectedFontSize: 12,
          selectedFontSize: 14,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Color(0xFFEC932B),
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Products',
                style: _textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              title: Text('User', style: _textStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list, color: Colors.white),
              title: Text('Orders', style: _textStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              title: Text('Cart', style: _textStyle),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            title: new Text('Exit'),
            content: new Text('Are you sure yout want to exit?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
