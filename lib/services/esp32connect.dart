import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:solotec/models/estacao_model.dart';

class ESP32Manage {
  Future<bool> isEstacao() async {
    final client = RetryClient(http.Client(), retries: 1);
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

  Future<bool> config(EstacaoModel model) async {
    var client = RetryClient(http.Client(), retries: 1);
    try {
      await client.post(Uri.parse('http://192.168.4.1/api/hora/'), body: {
        "HORA": DateTime.now().toUtc().millisecondsSinceEpoch
      }).then((_) async {
        await client.post(Uri.parse('http://192.168.4.1/api/at/'),
            body: model.toJson());
      }).then((_) async {
        await client.get(Uri.parse('http://192.168.4.1/rst/'));
      });

      return true;
    } catch (e) {
      return false;
    } finally {
      client.close();
    }
  }
}
