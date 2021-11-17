class MedicoesModel {
  int? hora;
  double? a18b20Temperatura;
  double? mhz19bCo2;
  double? ph4502cPh;
  double? dht11Temperatura;
  double? ccs811Co2;
  double? soilmoistureUmidade;
  double? dht11Umidade;
  double? dht11IndiceCalor;
  double? cjmcu101Luminosidade;
  String? uuid;
  String? estacao;
  String? mhrdChuva;
  double? ccs811Etvoc;
  double? mq8Hidrogenio;

  MedicoesModel(
      {this.hora,
      this.a18b20Temperatura,
      this.mhz19bCo2,
      this.ph4502cPh,
      this.dht11Temperatura,
      this.ccs811Co2,
      this.soilmoistureUmidade,
      this.dht11Umidade,
      this.dht11IndiceCalor,
      this.cjmcu101Luminosidade,
      this.uuid,
      this.estacao,
      this.mhrdChuva,
      this.ccs811Etvoc,
      this.mq8Hidrogenio});

  MedicoesModel.fromJson(Map<String, dynamic> json) {
    hora = json['hora'];
    a18b20Temperatura = json['a18b20_temperatura'];
    mhz19bCo2 = json['mhz19b_co2'];
    ph4502cPh = json['ph4502c_ph'];
    dht11Temperatura = json['dht11_temperatura'];
    ccs811Co2 = json['ccs811_co2'];
    soilmoistureUmidade = json['soilmoisture_umidade'];
    dht11Umidade = json['dht11_umidade'];
    dht11IndiceCalor = json['dht11_indiceCalor'];
    cjmcu101Luminosidade = json['cjmcu101_luminosidade'];
    uuid = json['uuid'];
    estacao = json['estacao'];
    mhrdChuva = json['mhrd_chuva'];
    ccs811Etvoc = json['ccs811_etvoc'];
    mq8Hidrogenio = json['mq8_hidrogenio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hora'] = this.hora;
    data['a18b20_temperatura'] = this.a18b20Temperatura;
    data['mhz19b_co2'] = this.mhz19bCo2;
    data['ph4502c_ph'] = this.ph4502cPh;
    data['dht11_temperatura'] = this.dht11Temperatura;
    data['ccs811_co2'] = this.ccs811Co2;
    data['soilmoisture_umidade'] = this.soilmoistureUmidade;
    data['dht11_umidade'] = this.dht11Umidade;
    data['dht11_indiceCalor'] = this.dht11IndiceCalor;
    data['cjmcu101_luminosidade'] = this.cjmcu101Luminosidade;
    data['uuid'] = this.uuid;
    data['estacao'] = this.estacao;
    data['mhrd_chuva'] = this.mhrdChuva;
    data['ccs811_etvoc'] = this.ccs811Etvoc;
    data['mq8_hidrogenio'] = this.mq8Hidrogenio;
    return data;
  }
}
