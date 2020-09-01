import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_x_todo/models/task_model.dart';
import 'package:get_x_todo/models/user_model.dart';

class Database {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _fireStore.collection("users").doc(user.id).set({
        "name": user.name.trim(),
        "email": user.email.trim(),
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
      return _fireStore
          .collection('users')
          .doc(uid)
          .collection("tasks")
          .orderBy("datecreated")
          .snapshots()
          .map((QuerySnapshot query) {
        List<TaskModel> tasksValues = List();
        query.docs.forEach((element) {
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

  Future<void> deleteTask(String uid, String taskId) {
    try {
      _fireStore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .doc(taskId)
          .delete()
          .then((value) => print("Task deleted"));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> clearTasks(String uid, String taskId) {
    try {
      _fireStore
          .collection("users")
          .doc(uid)
          .collection("tasks")
          .get()
          .then((snapshot) => {
                for (DocumentSnapshot documentSnapshot in snapshot.docs)
                  {documentSnapshot.reference.delete()}
              });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
