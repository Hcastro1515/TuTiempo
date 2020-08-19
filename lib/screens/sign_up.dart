import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/controllers/auth_controller.dart';

class SingUp extends GetWidget<AuthController> {
  TextEditingController userName = TextEditingController();
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
                controller: userName,
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
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
                child: Text("Register"),
                onPressed: () {
                  controller.createUser(userName.text, emailController.text,
                      passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
