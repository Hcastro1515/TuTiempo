import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'sign_up.dart';
import "../config.dart";

// ignore: must_be_immutable
class LoginPage extends GetWidget<AuthController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    child: SvgPicture.asset(logInImage),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              offset: Offset(0, 3))
                        ]),
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    margin: EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.purple,
                          errorStyle: TextStyle(color: Colors.red),
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff2AA1F6),
                          ),
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff2AA1F6),
                          ),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot Password?"),
                        ],
                      ),
                    ]),
                  ),
                  RaisedButton(
                    elevation: 0,
                    color: Color(0xff2AA1F6),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      controller.login(
                          emailController.text, passwordController.text);
                    },
                  ),
                  RaisedButton(
                    elevation: 0,
                    color: Color(0xff2AA1F6),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Get.to(SingUp());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
