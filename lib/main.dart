import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/controllers/bindings/auth_binding.dart';
import 'package:get_x_todo/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      home: LoginPage(),
    );
  }
}
