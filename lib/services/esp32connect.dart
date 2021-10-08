import 'package:http/http.dart' as http;
import 'package:solotec/models/estacao_model.dart';

class ESP32Manage {
  Future<bool> isEstacao() async {
    var res;
    try {
      res = await http.get(Uri.parse('http://192.168.4.1/api/'));
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } finally {}
  }

  Future<bool> config(EstacaoModel model) async {
    var client = http.Client();
    try {
      var basic = await client
          .post(Uri.parse('http://192.168.4.1/api/at/'), body: {"MODO_OP": ""});
    } finally {
      client.close();
    }
  }
}
