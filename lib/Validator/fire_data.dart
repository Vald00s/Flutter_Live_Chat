import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:notif/Auth/login_page.dart';

Future<void> userSetup(String name, String text,
    TextEditingController _passwordTextController) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  String email = auth.currentUser!.email.toString();
  users.add({
    'username': name,
    'uid': uid,
    'email': email,
    'status': 'Offline',
  });
}
