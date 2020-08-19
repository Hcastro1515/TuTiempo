import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id, email, name;

  UserModel({this.id, this.email, this.name});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.documentID;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
  }
}
