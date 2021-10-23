import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:solotec/models/estacao_model.dart';

class ESP32Manage {
  ESP32Manage._();
  static Future<bool> isEstacao() async {
    final client = RetryClient(http.Client(), retries: 0);
    try {
      await client.get(Uri.parse('http://192.168.4.1/'));

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    } finally {
      client.close();
    }
  }

  static Future<bool> config(EstacaoModel model) async {
    try {
      var ms = (DateTime.now()).millisecondsSinceEpoch;
      var a = (ms / 1000).round();

      String query = 'HORA=$a';

      await http
          .post(
        Uri.parse('http://192.168.4.1/api/hora/').replace(query: query),
      )
          .then(
        (_) async {
          String query2 = "data=${jsonEncode(model.toJson())}";
          await http.post(
            Uri.parse('http://192.168.4.1/api/at/').replace(
              query: query2,
            ),
          );
        },
      ).then((_) async {
        await http.get(
          Uri.parse('http://192.168.4.1/rst/'),
        );
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
