import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id, title, time;
  bool done;
  Timestamp dateCreated;
  Task({this.title, this.time});

  Task.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    title = documentSnapshot.get("title");
    time = documentSnapshot.get("time");
    dateCreated = documentSnapshot.get("dateCreated");
    done = documentSnapshot.get("done");
  }
}
