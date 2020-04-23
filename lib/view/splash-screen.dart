import 'package:flutter/material.dart';
import 'package:flutter_store/controllers/splash-controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = SplashController();


  @override
  void initState() {
    _controller.verifySavedEmail();
    Future.delayed(Duration(seconds: 2)).then((v)=> Navigator.pushReplacementNamed(context, "/login", arguments: _controller.savedEmail));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
        Image.asset("images/splash_screen.png", fit: BoxFit.fill,),
        Positioned(
          left: MediaQuery.of(context).size.width*0.45,
          bottom: MediaQuery.of(context).size.height*0.2,
          child: CircularProgressIndicator())
      ],),
    );
  }
}
