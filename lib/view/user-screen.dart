import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/controllers/user-controller.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:get_it/get_it.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = GetIt.I.call<UserStore>();
    final _controller = GetIt.I.call<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("User settings"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          ListTile(
            title: Text("User name"),
            subtitle: Text(_user.user.name),
            leading: Icon(Icons.person_pin),
          ),
          ListTile(
            title: Text("User email"),
            subtitle: Text(_user.user.email),
            leading: Icon(Icons.email),
          ),
          Observer(builder: (_) {
            return ListTile(
              onTap: (){
                _controller.setThemeData();
              },
              leading: _controller.darkTheme == false
                  ? Icon(
                      Icons.brightness_5,
                      color: Colors.yellow[700],
                    )
                  : Icon(
                      Icons.brightness_2,
                      color: Colors.black54,
                    ),
              title: Text("Change Theme mode"),
              subtitle:
                  Text(_controller.darkTheme ? "Dark Mode" : "Light Mode"),
            );
          })
        ],
      )),
    );
  }
}
