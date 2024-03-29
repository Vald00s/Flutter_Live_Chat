import 'package:cloud_firestore/cloud_firestore.dart';

class GrupManager {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  Future getUsersList() async {
    List itemsList = [];
    try {
      await users.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
