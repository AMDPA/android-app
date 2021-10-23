import 'package:cloud_firestore/cloud_firestore.dart';

class MedicoesModel {
  double? cjmcu;
  double? hidrogenio;
  Timestamp? hora;
  int? id;
  double? luminosidade;
  double? temperatura;
  double? umidade;
  String? uuid;

  MedicoesModel(
      {this.cjmcu,
      this.hidrogenio,
      this.hora,
      this.id,
      this.luminosidade,
      this.temperatura,
      this.umidade,
      this.uuid});

  MedicoesModel.fromJson(Map<String, dynamic> json) {
    cjmcu = json['cjmcu'];
    hidrogenio = json['hidrogenio'];
    hora = json['hora'];
    id = json['id'];
    luminosidade = json['luminosidade'];
    temperatura = json['temperatura'];
    umidade = json['umidade'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cjmcu'] = this.cjmcu;
    data['hidrogenio'] = this.hidrogenio;
    data['hora'] = this.hora;
    data['id'] = this.id;
    data['luminosidade'] = this.luminosidade;
    data['temperatura'] = this.temperatura;
    data['umidade'] = this.umidade;
    data['uuid'] = this.uuid;
    return data;
  }
}
