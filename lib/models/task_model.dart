import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id, title, time;
  bool done;
  Timestamp dateCreated;
  TaskModel({this.title, this.time});

  TaskModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    title = documentSnapshot.get("title");
    time = documentSnapshot.get("time");
    dateCreated = documentSnapshot.get("dateCreated");
    done = documentSnapshot.get("done");
  }
}
