import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username)async{
   return await Firestore.instance.collection("users").where("username",isEqualTo: username).getDocuments();
  }
  storeUserByUsername(userMap){
    Firestore.instance.collection("users").add(userMap);
  }
}