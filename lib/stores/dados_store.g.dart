// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosStore on _DadosStoreBase, Store {
  final _$loadAtom = Atom(name: '_DadosStoreBase.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$inicioAtom = Atom(name: '_DadosStoreBase.inicio');

  @override
  DateTime get inicio {
    _$inicioAtom.reportRead();
    return super.inicio;
  }

  @override
  set inicio(DateTime value) {
    _$inicioAtom.reportWrite(value, super.inicio, () {
      super.inicio = value;
    });
  }

  final _$fimAtom = Atom(name: '_DadosStoreBase.fim');

  @override
  DateTime get fim {
    _$fimAtom.reportRead();
    return super.fim;
  }

  @override
  set fim(DateTime value) {
    _$fimAtom.reportWrite(value, super.fim, () {
      super.fim = value;
    });
  }

  final _$pNomeAtom = Atom(name: '_DadosStoreBase.pNome');

  @override
  String get pNome {
    _$pNomeAtom.reportRead();
    return super.pNome;
  }

  @override
  set pNome(String value) {
    _$pNomeAtom.reportWrite(value, super.pNome, () {
      super.pNome = value;
    });
  }

  final _$periodoAtom = Atom(name: '_DadosStoreBase.periodo');

  @override
  String get periodo {
    _$periodoAtom.reportRead();
    return super.periodo;
  }

  @override
  set periodo(String value) {
    _$periodoAtom.reportWrite(value, super.periodo, () {
      super.periodo = value;
    });
  }

  final _$dadosAtom = Atom(name: '_DadosStoreBase.dados');

  @override
  List<MedicoesModel> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(List<MedicoesModel> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$temperaturaSoloSeriesAtom =
      Atom(name: '_DadosStoreBase.temperaturaSoloSeries');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get temperaturaSoloSeries {
    _$temperaturaSoloSeriesAtom.reportRead();
    return super.temperaturaSoloSeries;
  }

  @override
  set temperaturaSoloSeries(
      List<charts.Series<MedicoesModel, DateTime>> value) {
    _$temperaturaSoloSeriesAtom.reportWrite(value, super.temperaturaSoloSeries,
        () {
      super.temperaturaSoloSeries = value;
    });
  }

  final _$pHSeriesAtom = Atom(name: '_DadosStoreBase.pHSeries');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get pHSeries {
    _$pHSeriesAtom.reportRead();
    return super.pHSeries;
  }

  @override
  set pHSeries(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$pHSeriesAtom.reportWrite(value, super.pHSeries, () {
      super.pHSeries = value;
    });
  }

  final _$tempAmbSeriesAtom = Atom(name: '_DadosStoreBase.tempAmbSeries');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get tempAmbSeries {
    _$tempAmbSeriesAtom.reportRead();
    return super.tempAmbSeries;
  }

  @override
  set tempAmbSeries(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$tempAmbSeriesAtom.reportWrite(value, super.tempAmbSeries, () {
      super.tempAmbSeries = value;
    });
  }

  final _$co2Atom = Atom(name: '_DadosStoreBase.co2');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get co2 {
    _$co2Atom.reportRead();
    return super.co2;
  }

  @override
  set co2(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$co2Atom.reportWrite(value, super.co2, () {
      super.co2 = value;
    });
  }

  final _$umidSoloAtom = Atom(name: '_DadosStoreBase.umidSolo');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get umidSolo {
    _$umidSoloAtom.reportRead();
    return super.umidSolo;
  }

  @override
  set umidSolo(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$umidSoloAtom.reportWrite(value, super.umidSolo, () {
      super.umidSolo = value;
    });
  }

  final _$umidAmbAtom = Atom(name: '_DadosStoreBase.umidAmb');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get umidAmb {
    _$umidAmbAtom.reportRead();
    return super.umidAmb;
  }

  @override
  set umidAmb(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$umidAmbAtom.reportWrite(value, super.umidAmb, () {
      super.umidAmb = value;
    });
  }

  final _$luminosidadeAtom = Atom(name: '_DadosStoreBase.luminosidade');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get luminosidade {
    _$luminosidadeAtom.reportRead();
    return super.luminosidade;
  }

  @override
  set luminosidade(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$luminosidadeAtom.reportWrite(value, super.luminosidade, () {
      super.luminosidade = value;
    });
  }

  @override
  String toString() {
    return '''
load: ${load},
inicio: ${inicio},
fim: ${fim},
pNome: ${pNome},
periodo: ${periodo},
dados: ${dados},
temperaturaSoloSeries: ${temperaturaSoloSeries},
pHSeries: ${pHSeries},
tempAmbSeries: ${tempAmbSeries},
co2: ${co2},
umidSolo: ${umidSolo},
umidAmb: ${umidAmb},
luminosidade: ${luminosidade}
    ''';
  }
}
