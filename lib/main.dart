import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solotec/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init firebase
  await Firebase.initializeApp();

  runApp(Splash());
}
