import 'package:geolocator/geolocator.dart';

class LocalManager {
  Future<Position> getAtual() async {
    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
