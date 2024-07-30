import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> setInstance(String title, String? data) async {
    final pref = await SharedPreferences.getInstance();

    pref.setString(title, data ?? "");
  }

  Future<String?> getInstance(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(title);

    log("shared pref get - $result");

    return result;
  }
}
