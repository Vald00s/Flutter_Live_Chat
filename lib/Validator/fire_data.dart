import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';

Future<void> userSetup(String displayName, String text,
    TextEditingController passwordTextController) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  String email = auth.currentUser!.email.toString();
  users.add({'displayName': displayName, 'uid': uid, 'email': email});
}
