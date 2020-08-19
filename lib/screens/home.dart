import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Homes"), 
            RaisedButton(
              child: Text("Sign out"),
              onPressed: (){
                controller.signOut(); 
              },
            )
          ],
        ),
      ),
    );
  }
}