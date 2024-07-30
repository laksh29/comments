import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'navigator.dart';

class AuthServices {
  final _authInst = FirebaseAuth.instance;

  Future<UserCredential?> signup(
      BuildContext context, String email, String password, String name) async {
    try {
      UserCredential cred = await _authInst.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _authInst.currentUser!.updateDisplayName(name);

      log("[signup] user data : ${cred.user!.uid} - ${cred.user!.email} - ${cred.user!.displayName}");

      return cred;
    } on FirebaseAuthException catch (e) {
      log("fb signup error : $e");
      var msg = e.toString().split("] ")[1];
      NavigatorService().showSnackbar(context, msg);
    }
    return null;
  }

  Future<UserCredential?> login(
      BuildContext context, String email, String password) async {
    try {
      var cred = await _authInst.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log("[login] user data : ${cred.user!.uid} - ${cred.user!.email} - ${cred.user!.displayName}");

      return cred;
    } on FirebaseAuthException catch (e) {
      log('fb login error : $e');
      var msg = e.toString().split("] ")[1];
      NavigatorService().showSnackbar(context, msg);
    }
    return null;
  }

  Future<bool> signout() async {
    try {
      await _authInst.signOut();
      return true;
    } catch (e) {
      log('fb logout error : $e');
      return false;
    }
  }
}
