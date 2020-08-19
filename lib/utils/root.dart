import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/screens/home.dart';

import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import '../screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
