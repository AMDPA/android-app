import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:open_file/open_file.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:solotec/services/firestore.dart';

class RelatoriosService {
  RelatoriosService._();

  static Future<String> newRelatorio(DateTime inicio, DateTime fim) async {
    var i = (inicio.millisecondsSinceEpoch / 1000).round();
    var f = (fim.millisecondsSinceEpoch / 1000).round();

    try {
      var url = await http.get(
          Uri.parse("https://api-amacpa.herokuapp.com/relatorio/$i/$f"),
          headers: {
            "Content-type": "application/json",
            "User": FirestoreManage.getUser()!.uid,
            "Email": FirestoreManage.getUser()!.email!,
            "Nome": FirestoreManage.getUser()!.displayName!
          });
      print("MSG::" + url.body.replaceAll("\"", ""));
      return url.body.replaceAll("\"", "");
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      return "";
    }
  }

  static Future<bool> downloadRelatorio(
      String url, void Function(int, int) receiveProgress) async {
    Directory down = await getApplicationDocumentsDirectory();

    List<String> urlp = url.split('/${FirestoreManage.getUser()!.uid}/');

    final savePath = path.join('${down.path}/solotech/', urlp[urlp.length - 1]);

    Dio dio = Dio();

    try {
      await dio.download(url, savePath, onReceiveProgress: receiveProgress);
      return true;
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      return false;
    }
  }

  static Future<void> openRelatorio(String urlOrigin) async {
    Directory down = await getApplicationDocumentsDirectory();

    List<String> urlp = urlOrigin.split('/${FirestoreManage.getUser()!.uid}/');

    final savePath = path.join('${down.path}/solotech/', urlp[urlp.length - 1]);
    OpenResult p = await OpenFile.open(savePath);
    print("MSG:: ${p.message}");
  }

  static Future<bool> relatorioExiste(String urlOrigin) async {
    Directory down = await getApplicationDocumentsDirectory();

    List<String> urlp = urlOrigin.split('/${FirestoreManage.getUser()!.uid}/');

    final savePath = path.join('${down.path}/solotech/', urlp[urlp.length - 1]);
    if (await io.File(savePath).exists()) {
      return true;
    } else {
      return false;
    }
  }
}
