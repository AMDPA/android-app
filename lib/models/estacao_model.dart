import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:solotec/constants/enuns.dart';

class EstacaoModel {
  EstacaoModel(
      {this.name,
      this.description,
      this.local,
      this.modoOP,
      this.apSsid,
      this.apPass,
      this.createdAt});
  String name;
  String description;
  String userUiid;
  Position local;
  ModoOperacionalEstacao modoOP;
  String apSsid;
  String apPass;
  DateTime createdAt;
  DateTime updateAt = DateTime.now();

  EstacaoModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'] as String;
    this.description = json['description'] as String;
    this.userUiid = json['user'] as String;

    Timestamp localTimestamp = json['local']['timestamp'] as Timestamp;
    this.local = Position(
        longitude: json['local']['longitude'] as double,
        latitude: json['local']['latitude'] as double,
        timestamp: localTimestamp.toDate(),
        accuracy: json['local']['accuracy'] as double,
        altitude: json['local']['altitude'] as double,
        heading: json['local']['heading'] as double,
        speed: json['local']['speed'] as double,
        speedAccuracy: json['local']['speedAccuracy'] as double);

    this.modoOP = (json['isRemote'] as bool)
        ? ModoOperacionalEstacao.Remoto
        : ModoOperacionalEstacao.Local;

    this.apSsid = json['localRede']['ssid'] as String;
    this.apPass = json['localRede']['password'] as String;

    Timestamp create = json['createdAt'] as Timestamp;
    Timestamp update = json['updateAt'] as Timestamp;
    createdAt = create.toDate();
    updateAt = update.toDate();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'description': this.description,
      'user': this.userUiid,
      'local': {
        'longitude': local.longitude,
        'latitude': local.latitude,
        'timestamp': Timestamp.fromDate(local.timestamp),
        'accuracy': local.accuracy,
        'altitute': local.altitude,
        'heading': local.heading,
        'speed': local.speed,
        'speedAccuracy': local.speedAccuracy
      },
      'isRemote': (this.modoOP == ModoOperacionalEstacao.Remoto ? true : false),
      'localRede': {
        'ssid': this.apSsid,
        'password': this.apPass,
      },
      "createdAt": Timestamp.fromDate(this.createdAt),
      "updateAt": Timestamp.fromDate(this.updateAt)
    };
  }
}
