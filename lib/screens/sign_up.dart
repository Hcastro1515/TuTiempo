import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/controllers/auth_controller.dart';

import '../config.dart';

class SingUp extends GetWidget<AuthController> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();

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
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Name cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter a correct email address";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
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
                            validator: (value) {
                              if (value.isEmpty &&
                                  value.contains(new RegExp(
                                      r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"))) {
                                return "password must be 8 characters";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.done,
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
                      if (_signUpFormKey.currentState.validate()) {
                        controller.createUser(userName.text,
                            emailController.text, passwordController.text);
                      }
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
