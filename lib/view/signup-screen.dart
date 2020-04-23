import 'package:flutter/material.dart';
import 'package:flutter_store/controllers/signup-controller.dart';
import 'package:flutter_store/utils/user-validator.dart';
import 'package:flutter_store/view/widgets/custom-dialogs.dart';

class SignUpScreen extends StatelessWidget with UserValidator {
  final _dialogs = CustomDialogs();
  final _controller = SignUpController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48,
        child: Icon(Icons.star_border, color: Colors.yellow, size: MediaQuery.of(context).size.height*0.05,),
      ),
    );

    final name = TextFormField(
      onSaved: _controller.setName,
      validator: validateName,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      onSaved: _controller.setEmail,
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confirmPassword = TextFormField(
      validator: _controller.confirmPassword,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      onChanged: _controller.onChangePassword,
      validator: validatePassword,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    final signUpButton = RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async{
          if(_formKey.currentState.validate())
          {_formKey.currentState.save();
          _dialogs.showLoadingDialog(context);
          String result = await _controller.createUser();
          if(result != "OK") {
            Navigator.pop(context);
            _dialogs.showMessageDialog(context, "Erro", result.toString());
            }
          else{
            Navigator.pop(context);  
            Navigator.pushReplacementNamed(context, '/home');
            }}
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange[300],
        child: Text('SignUp', style: TextStyle(color: Colors.white)),
      );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
          child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 38.0),
              name,
              SizedBox(height: 8.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 8.0),
              confirmPassword,
              SizedBox(height: 24.0),
              signUpButton,
            ],
          ),
        ),
      ),
    );
  }

// void _showMessageDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // retorna um objeto do tipo Dialog
//         return AlertDialog(
//           title: new Text(title),
//           content: new Text(message),
//           actions: <Widget>[
//             // define os botões na base do dialogo
//             new FlatButton(
//               child: new Text("Fechar"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
// }

// void _showLoadingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             title: Text("Carregando...", textAlign: TextAlign.center,),
//             content: SizedBox(height: 38, width: 38,child: Center(child: CircularProgressIndicator())),
//           );
//       },
//     );
// }

}