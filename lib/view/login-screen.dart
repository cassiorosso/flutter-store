import 'package:flutter/material.dart';
import 'package:flutter_store/controllers/login-controller.dart';
import 'package:flutter_store/utils/user-validator.dart';

class LoginScreen extends StatelessWidget with UserValidator {
  final String savedEmail;
  final _formKey = GlobalKey<FormState>();
  final _controller = LoginController();

  LoginScreen({Key key, this.savedEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 80,
      child: Image.asset("images/logo.png"),
    );

    final email = TextFormField(
      onSaved: _controller.setEmail,
      validator: validateEmail,
      initialValue: savedEmail,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white70),
        fillColor: Colors.white,
        hintText: 'Email',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: .5),
            borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    final password = TextFormField(
      style: TextStyle(color: Colors.white),
      onSaved: _controller.setPassword,
      validator: validatePassword,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: .5),
            borderRadius: BorderRadius.circular(20)),
        hintStyle: TextStyle(color: Colors.white70),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            String result = await _controller.loginUser();
            if (result != null) {
              _controller.saveEmail(savedEmail);
              Navigator.pushReplacementNamed(context, '/home');
            }
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('LogIn', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.white70),
      ),
      onPressed: () {},
    );

    final signUpButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
      },
      padding: EdgeInsets.all(12),
      color: Colors.orange[300],
      child: Text('SignUp', style: TextStyle(color: Colors.white)),
    );

    return Scaffold(
      backgroundColor: Color(0xFF33333D),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              signUpButton,
              forgotLabel
            ],
          ),
        ),
      ),
    );
  }
}
