
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Scaffold without context
class GlobalScaffold{
  final scaffKey = GlobalKey<ScaffoldState>();

  void showSnackBar(SnackBar snack){
    scaffKey.currentState.showSnackBar(snack);
  }

}