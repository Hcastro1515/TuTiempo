import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/controllers/user_controller.dart';
import 'package:get_x_todo/models/user_model.dart';
import 'package:get_x_todo/services/database.dart';

import '../services/database.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>();

  FirebaseUser get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_firebaseAuth.onAuthStateChanged);
  }

  void createUser(String name, String email, String password) async {
    try {
      AuthResult _authresult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      UserModel _user = UserModel(
        email: _authresult.user.email,
        name: name,
        id: _authresult.user.uid,
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
      AuthResult _authresult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: email);

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
