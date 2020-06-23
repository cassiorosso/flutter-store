import 'package:flutter/material.dart';

class CustomDialogs {
  void showMessageDialog(BuildContext context, String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
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
      },
    );
  }

  Widget loader(BuildContext context, String url) => Center(
        child: CircularProgressIndicator(),
      );

  Widget error(BuildContext context, String url, dynamic error) {
    return Center(child: const Icon(Icons.error));
  }
}
