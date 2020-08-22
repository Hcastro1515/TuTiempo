import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String taskId, title, time;
  bool done;
  Timestamp dateCreated;
  TaskModel({this.title, this.time});

  TaskModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    taskId = documentSnapshot.id;
    title = documentSnapshot.get("title");
    time = documentSnapshot.get("time");
    dateCreated = documentSnapshot.get("datecreated");
    done = documentSnapshot.get("done");
  }
}
