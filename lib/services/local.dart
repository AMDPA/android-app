import 'package:geolocator/geolocator.dart';

class LocalManager {
  LocalManager._();
  static Future<Position> getAtual() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
