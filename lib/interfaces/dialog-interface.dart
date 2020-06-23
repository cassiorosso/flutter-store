import 'package:flutter/material.dart';
abstract class IDialog {

  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions);
}

class DialogAction<T> {
  T child;
  Function onPressed;
  DialogAction({
    @required this.child,
    @required this.onPressed,
  });

}