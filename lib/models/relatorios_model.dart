class RelatoriosModel {
  int? dataInicial;
  int? dataFinal;
  String? url;
  String? descri;

  RelatoriosModel({this.dataInicial, this.dataFinal, this.url, this.descri});

  RelatoriosModel.fromJson(Map<String, dynamic> json) {
    dataInicial = json['dataInicial'];
    dataFinal = json['dataFinal'];
    url = json['url'];
    descri = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataInicial'] = this.dataInicial;
    data['dataFinal'] = this.dataFinal;
    data['url'] = this.url;
    data['descricao'] = this.descri;
    return data;
  }
}
