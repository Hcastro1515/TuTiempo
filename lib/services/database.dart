import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_x_todo/models/user_model.dart';

class Database {
  final Firestore _fireStore = Firestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _fireStore.collection("users").document(user.id).setData({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
