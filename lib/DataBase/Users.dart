import 'package:firebase_database/firebase_database.dart';
class UserServices{
  FirebaseDatabase database = FirebaseDatabase.instance;
  String ref = "users";
  createUser(Map value){
    String id = value["userId"];
    database.reference().child("$ref/$id").set(
        value
    ).catchError((error)=> {print(error.toString())});
  }

}