import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/controllers/auth_controller.dart';

import '../config.dart';

class SingUp extends GetWidget<AuthController> {
  TextEditingController userName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Sign in"),
          backgroundColor: Color(0xff2AA1F6),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: SvgPicture.asset(signUpImage),
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
                    margin: EdgeInsets.only(bottom: 30, top: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userName,
                          decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.account_circle,
                                color: Color(0xff2AA1F6)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xff2AA1F6)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xff2AA1F6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Color(0xff2AA1F6),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      controller.createUser(userName.text, emailController.text,
                          passwordController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
