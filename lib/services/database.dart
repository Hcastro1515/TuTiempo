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

  Stream<List<TaskModel>> taskStream(String uid) {
    try {
      Stream<QuerySnapshot> data = _fireStore
          .collection('users')
          .doc(uid)
          .collection("tasks")
          .orderBy("dateCreated")
          .snapshots();
      return data.map((QuerySnapshot query) {
        List<TaskModel> tasksValues = List();
        query.docs.forEach((element) {
          print("Data $element");
          tasksValues.add(TaskModel.fromDocumentSnapshot(element));
        });
        return tasksValues;
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _fireStore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
