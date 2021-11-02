import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:solotec/models/estacao_model.dart';

class ESP32Manage {
  ESP32Manage._();
  static Future<bool> isEstacao() async {
    final client = RetryClient(http.Client(), retries: 0);
    try {
      var t = await client.get(Uri.parse('http://192.168.4.1/'));

      if (t.statusCode != 200) {
        return false;
      }
      return true;
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      return false;
    } finally {
      client.close();
    }
  }

  static Future<bool> config(EstacaoModel model) async {
    final client = RetryClient(http.Client(), retries: 0);
    try {
      var ms = (DateTime.now()).millisecondsSinceEpoch;
      var a = (ms / 1000).round();

      String query = 'HORA=$a';

      var hh = await client.post(
        Uri.parse('http://192.168.4.1/api/hora/').replace(query: query),
      );

      if (hh.statusCode != 200) {
        return false;
      }

      String query2 = jsonEncode(model.toJson());
      var qq = await http.post(Uri.parse('http://192.168.4.1/api/at/'),
          body: query2);

      if (qq.statusCode != 200) {
        return false;
      }

      await http.get(
        Uri.parse('http://192.168.4.1/rst/'),
      );

      return true;
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      return false;
    } finally {
      client.close();
    }
  }
}
