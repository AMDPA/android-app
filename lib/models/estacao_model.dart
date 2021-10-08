import 'package:cloud_firestore/cloud_firestore.dart';

class EstacaoModel {
  EstacaoModel({this.createdAt, this.localizacao, this.name, this.updateAt});

  Timestamp createdAt;
  GeoPoint localizacao;
  String name;
  Timestamp updateAt;

  EstacaoModel.fromJson(Map<String, Object> json)
      : this(
            createdAt: json['createdAt'] as Timestamp,
            localizacao: json['localizacao'] as GeoPoint,
            name: json['name'] as String,
            updateAt: json['updateAt'] as Timestamp);

  Map<String, Object> toJson() {
    return {
      'createdAt': createdAt,
      'localizacao': localizacao,
      'name': name,
      'updateAt': updateAt
    };
  }
}
