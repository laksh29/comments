import 'dart:developer';

import 'package:comments/models/user_model.dart';
import 'package:comments/providers/auth_provider.dart';
import 'package:comments/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirestoreProvider extends ChangeNotifier {
  String? uid;
  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;

  UserModel? _user;
  UserModel? get user => _user;

  Future updateUserDoc(
      BuildContext context, String updateField, String updateData) async {
    try {
      _isUpdated = false;
      notifyListeners();

      uid = Provider.of<AuthProvider>(context, listen: false).userId;

      FirestoreServices().updateUserDoc(uid!, {updateField: updateData});

      _isUpdated = true;
      notifyListeners();
    } catch (e) {
      log("update prov error : $e");
    }
  }

  Future getUserDoc(BuildContext context) async {
    try {
      uid = Provider.of<AuthProvider>(context, listen: false).userId;

      _user = await FirestoreServices().getUserDoc(uid!);
      notifyListeners();
    } catch (e) {
      log("get user prov error : $e");
    }
  }
}
