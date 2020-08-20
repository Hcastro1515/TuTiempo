import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id, title, time;
  bool done;
  Timestamp dateCreated;
  Task({this.title, this.time});

  Task.fromDocumentSnapshot(QueryDocumentSnapshot queryDocumentSnapshot) {
    id = queryDocumentSnapshot.id;
    title = queryDocumentSnapshot.get("title");
    time = queryDocumentSnapshot.get("time");
    dateCreated = queryDocumentSnapshot.get("dateCreated");
    done = queryDocumentSnapshot.get("done");
  }
}
