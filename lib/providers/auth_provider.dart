// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:comments/screens/comments_screen.dart';
import 'package:comments/screens/login_screen.dart';
import 'package:comments/services/auth_services.dart';
import 'package:comments/services/firestore_services.dart';
import 'package:comments/services/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../services/shared_pref.dart';

class AuthProvider extends ChangeNotifier {
  String? email;
  String? name;
  String? userId;

  bool _signupSuccessful = false;
  bool get signupSuccessful => _signupSuccessful;

  bool _loginSuccessful = false;
  bool get loginSuccessful => _loginSuccessful;

  void navigateToHome(BuildContext context) {
    NavigatorService().clearNavigate(context, const CommentsScreen());
  }

  Future signupUser(
      BuildContext context, String email, String password, String name) async {
    try {
      _signupSuccessful = false;
      notifyListeners();

      UserCredential? user =
          await AuthServices().signup(context, email, password, name);

      email = email;
      name = name;
      userId = user!.user!.uid;

      _signupSuccessful = user == null ? false : true;
      notifyListeners();

      FirestoreServices().createUserDoc(userId!, name, email);

      if (signupSuccessful) {
        SharedPref().setInstance('email', email);
        SharedPref().setInstance('password', password);
        navigateToHome(context);
      }
    } catch (e) {
      log("signup prov error : $e");
    }
  }

  Future loginUser(BuildContext context, String email, String password) async {
    try {
      _loginSuccessful = false;
      notifyListeners();

      UserCredential? user =
          await AuthServices().login(context, email, password);

      email = email;
      name = user?.user?.displayName;
      userId = user!.user!.uid;

      log("name prov : $name");
      // log("user : $user");

      _loginSuccessful = user == null ? false : true;
      notifyListeners();

      if (loginSuccessful) {
        SharedPref().setInstance('email', email);
        SharedPref().setInstance('password', password);
        navigateToHome(context);
      }
    } catch (e) {
      log("login prov error : $e");
    }
  }

  Future logout(BuildContext context) async {
    await AuthServices().signout();

    SharedPref().setInstance('email', null);
    SharedPref().setInstance('password', null);

    NavigatorService().clearNavigate(context, const LoginScreen());
  }

  Future autoLogin(BuildContext context) async {
    String? email = await SharedPref().getInstance('email');
    String? password = await SharedPref().getInstance('password');

    if (email != "" && password != "") {
      loginUser(context, email!, password!);
    } else {
      NavigatorService().clearNavigate(context, const LoginScreen());
    }
  }
}
