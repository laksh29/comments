import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigServices {
  final FirebaseRemoteConfig firebaseRemoteConfig =
      FirebaseRemoteConfig.instance;

  Future init() async {
    try {
      await firebaseRemoteConfig.ensureInitialized();
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );

      await firebaseRemoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      log("remote config error : $e");
    }
  }

  bool maskEmail() => firebaseRemoteConfig.getBool("mask_email");
}
