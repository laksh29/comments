import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FirestoreServices {
  final _firestoreInst = FirebaseFirestore.instance;

  void createUserDoc(String uid, String name, String email) {
    try {
      log("create user doc : $uid - $name - $email");
      UserModel user = UserModel(
        uid: uid,
        name: name,
        email: email,
      );

      _firestoreInst.collection('commentsUser').doc(uid).set(user.toJson());
    } catch (e) {
      log("fs create user error : $e");
    }
  }

  void updateUserDoc(String uid, Map<String, dynamic> data) {
    try {
      _firestoreInst.collection('commentsUser').doc(uid).update(
            data,
          );
    } catch (e) {
      log('fs update user doc error : $e');
    }
  }

  Future<UserModel?> getUserDoc(String uid) async {
    try {
      var temp = await _firestoreInst.collection('commentsUser').doc(uid).get();

      log("get user doc : ${temp.data()}");

      if (temp.data() != null) {
        return UserModel.fromJson(temp.data()!);
      }
    } catch (e) {
      log("fs get user doc error : $e");
    }
    return null;
  }
}
