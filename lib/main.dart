import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solotec/splash.dart';

import 'package:flutter/foundation.dart' show kDebugMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init firebase
  await Firebase.initializeApp();

  if (!Platform.isAndroid &&
      !Platform.isFuchsia &&
      !Platform.isIOS &&
      !Platform.isLinux &&
      !Platform.isMacOS &&
      !Platform.isWindows) {
    await FirebaseFirestore.instance.enablePersistence();
  }

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    Function(FlutterErrorDetails)? oriError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails a) async {
      await FirebaseCrashlytics.instance.recordFlutterError(a);
      oriError!(a);
    };
  }

  Intl.defaultLocale = 'pt_BR';

  runApp(Splash());
}
