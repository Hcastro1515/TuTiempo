import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/screens/sign_up.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Sign up"),
                onPressed: () {
                  Get.to(SingUp()); 
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
