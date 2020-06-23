import 'package:flutter/material.dart';
import 'package:flutter_store/interfaces/dialog-interface.dart';

class AndroidDialog implements IDialog {
  
  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: title,
      content: content,
      actions: actions?.map((a) {
        return FlatButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      })?.toList(),
    );
  }
}