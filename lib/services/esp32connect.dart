import 'package:http/http.dart' as http;

class ESP32Manage {
  Future<bool> isEstacao() async {
    var res;
    try {
      res = await http.get(Uri.parse('http://192.168.4.1'));
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } finally {}
  }
}
