import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/controllers/user_controller.dart';
import 'package:get_x_todo/models/user_model.dart';
import 'package:get_x_todo/services/database.dart';

import '../services/database.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }

    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authresult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim().toLowerCase(), password: password);

      Get.find<UserController>().user =
          await Database().getUser(_authresult.user.uid);
    } catch (e) {
      Get.snackbar("Error logging in", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar("Error signing out", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
