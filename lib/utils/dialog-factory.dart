import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_store/interfaces/dialog-interface.dart';
import 'package:flutter_store/view/widgets/android-dialog.dart';
import 'package:flutter_store/view/widgets/ios-dialog.dart';

//Factory for custom dialogs for Ios or Android
class DialogFactory {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T> showAlertDialog<T>({
    Widget title,
    Widget content,
    List<DialogAction> actions,
    bool forceAndroid=false,
    bool forceIos=false
  }) {
    IDialog dialogData;

    if ((Platform.isIOS || forceIos) && !forceAndroid) {
      dialogData = IosDialog();
    } else if((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: navigatorKey.currentState.overlay.context,
      builder: (context) => dialogData.create(
        context,
        title ?? Text('Não informado'),
        content ?? Text('Não informado'),
        actions ?? [],
      ),
    );
  }

    static Future<void> showLoadingDialog() async {
    return showDialog<void>(
        context: navigatorKey.currentState.overlay.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            "Please wait...",
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
              height: 38,
              width: 38,
              child: Center(child: CircularProgressIndicator())),
        );
        });
  }
}