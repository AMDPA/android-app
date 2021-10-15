class RelatoriosModel {
  int dataInicial;
  int dataFinal;
  String url;

  RelatoriosModel({this.dataInicial, this.dataFinal, this.url});

  RelatoriosModel.fromJson(Map<String, dynamic> json) {
    dataInicial = json['dataInicial'];
    dataFinal = json['dataFinal'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataInicial'] = this.dataInicial;
    data['dataFinal'] = this.dataFinal;
    data['url'] = this.url;
    return data;
  }
}
