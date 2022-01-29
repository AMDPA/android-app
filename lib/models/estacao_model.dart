class EstacaoModel {
  int? id;
  String? name;
  String? description;
  String? user;
  bool? isRemote;
  Local? local;
  LocalRede? localRede;
  DateTime? createdAt;
  DateTime updateAt = DateTime.now();
  String path = '';

  EstacaoModel({
    this.id,
    this.name,
    this.description,
    this.user,
    this.isRemote,
    this.local,
    this.localRede,
    this.createdAt,
  });

  EstacaoModel.fromJson(Map<String, dynamic> json) {
    id = json['estacao'] as int?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    user = json['user'] as String?;
    isRemote = json['isRemote'] as bool?;
    local = json['local'] != null ? new Local.fromJson(json['local']) : null;
    localRede = json['localRede'] != null
        ? new LocalRede.fromJson(json['localRede'])
        : null;
    createdAt = DateTime.parse(json['createdAt'] as String);
    updateAt = DateTime.parse(json['updateAt'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estacao'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['user'] = this.user;
    data['isRemote'] = this.isRemote;
    if (this.local != null) {
      data['local'] = this.local!.toJson();
    }
    if (this.localRede != null) {
      data['localRede'] = this.localRede!.toJson();
    }
    data['createdAt'] = this.createdAt.toString();
    data['updateAt'] = this.updateAt.toString();

    return data;
  }
}

class Local {
  double? longitude;
  double? latitude;
  DateTime? timestamp;
  double? accuracy;
  double? altitute;
  double? heading;
  double? speed;
  double? speedAccuracy;

  Local(
      {this.longitude,
      this.latitude,
      this.timestamp,
      this.accuracy,
      this.altitute,
      this.heading,
      this.speed,
      this.speedAccuracy});

  Local.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'] as double?;
    latitude = json['latitude'] as double?;
    timestamp = DateTime.parse(json['timestamp'] as String);
    accuracy = json['accuracy'] as double?;
    altitute = json['altitute'] as double?;
    heading = json['heading'] as double?;
    speed = json['speed'] as double?;
    speedAccuracy = json['speedAccuracy'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['timestamp'] = timestamp.toString();
    data['accuracy'] = this.accuracy;
    data['altitute'] = this.altitute;
    data['heading'] = this.heading;
    data['speed'] = this.speed;
    data['speedAccuracy'] = this.speedAccuracy;
    return data;
  }
}

class LocalRede {
  String? ssid;
  String? password;

  LocalRede({this.ssid, this.password});

  LocalRede.fromJson(Map<String, dynamic> json) {
    ssid = json['ssid'] as String?;
    password = json['password'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ssid'] = this.ssid;
    data['password'] = this.password;
    return data;
  }
}
