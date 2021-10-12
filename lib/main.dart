import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solotec/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init firebase
  await Firebase.initializeApp();

  if (!Platform.isAndroid &&
      !Platform.isFuchsia &&
      Platform.isIOS &&
      Platform.isLinux &&
      Platform.isMacOS &&
      Platform.isWindows) {
    await FirebaseFirestore.instance.enablePersistence();
  }

  runApp(Splash());
}
