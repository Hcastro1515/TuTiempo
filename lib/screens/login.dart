import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'sign_up.dart';

class LoginPage extends GetWidget<AuthController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
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
