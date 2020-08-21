import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_x_todo/models/task_model.dart';
import 'package:get_x_todo/models/user_model.dart';

class Database {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _fireStore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _fireStore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTask(String title, String time, String uid) async {
    try {
      await _fireStore.collection("users").doc(uid).collection("tasks").add({
        'datecreated': Timestamp.now(),
        'title': title,
        'time': time,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  
  Stream<List<Task>> taskStream(String uid) {
    return _fireStore
        .collection('users')
        .doc(uid)
        .collection("tasks")
        .orderBy("dateCreated")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Task> tasksValues = List();
      query.docs.forEach((element) {
        print(element); 
        tasksValues.add(Task.fromDocumentSnapshot(element));
      });
      return tasksValues;
    });
  }
}
