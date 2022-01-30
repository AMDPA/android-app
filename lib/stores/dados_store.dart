import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/models/medicoes_model.dart';
import 'package:solotec/services/firestore.dart';
import 'package:charts_flutter/flutter.dart' as charts;

part 'dados_store.g.dart';

class DadosStore = _DadosStoreBase with _$DadosStore;

abstract class _DadosStoreBase with Store {
  _DadosStoreBase() {
    pNome = 'Últimas 24h';

    final df = new DateFormat('dd/MM/yyyy HH:mm');
    periodo = "${df.format(inicio)} - ${df.format(fim)}";
    getData();
  }

  @observable
  bool load = false;

  @observable
  DateTime inicio = DateTime.now().subtract(Duration(hours: 24));

  @observable
  DateTime fim = DateTime.now();

  @observable
  String pNome = '';

  @observable
  String periodo = '';

  @observable
  List<MedicoesModel> dados = <MedicoesModel>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> temperaturaSoloSeries =
      <charts.Series<MedicoesModel, DateTime>>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> pHSeries =
      <charts.Series<MedicoesModel, DateTime>>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> tempAmbSeries =
      <charts.Series<MedicoesModel, DateTime>>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> co2 =
      <charts.Series<MedicoesModel, DateTime>>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> umidSolo =
      <charts.Series<MedicoesModel, DateTime>>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> umidAmb =
      <charts.Series<MedicoesModel, DateTime>>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> luminosidade =
      <charts.Series<MedicoesModel, DateTime>>[];

  getData() async {
    load = true;

    dados = <MedicoesModel>[];
    temperaturaSoloSeries = <charts.Series<MedicoesModel, DateTime>>[];
    pHSeries = <charts.Series<MedicoesModel, DateTime>>[];
    tempAmbSeries = <charts.Series<MedicoesModel, DateTime>>[];
    co2 = <charts.Series<MedicoesModel, DateTime>>[];
    umidSolo = <charts.Series<MedicoesModel, DateTime>>[];
    luminosidade = <charts.Series<MedicoesModel, DateTime>>[];

    await FirestoreManage.getPeriodo(inicio, fim)
        .then((value) => dados.addAll(value));

    temperaturaSoloSeries.add(
      charts.Series(
          id: "Temperatura Solo",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.a18b20Temperatura,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );
    pHSeries.add(
      charts.Series(
          id: "pH",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.ph4502cPh,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );
    tempAmbSeries.add(
      charts.Series(
          id: "Temperatura Ambiente",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.dht11Temperatura,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    co2.add(
      charts.Series(
          id: "co2",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.ccs811Co2,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    umidSolo.add(
      charts.Series(
          id: "Umidade Do Solo",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.soilmoistureUmidade,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    umidAmb.add(
      charts.Series(
          id: "Umidade Ambiente",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.dht11Umidade,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    umidAmb.add(
      charts.Series(
          id: "Umidade Ambiente",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.dht11Umidade,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    umidAmb.add(
      charts.Series(
          id: "Luminosidade",
          data: dados,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.cjmcu101Luminosidade,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    load = false;
  }

  void setPeriodo(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Selecionar período"),
            content: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text("Últimas 24h"),
                    onTap: () {
                      inicio = DateTime.now().subtract(Duration(hours: 24));
                      pNome = 'Últimas 24h';

                      final df = new DateFormat('dd/MM/yyyy HH:mm');
                      periodo = "${df.format(inicio)} - ${df.format(fim)}";
                      Navigator.of(context).pop();
                      getData();
                    },
                  ),
                  ListTile(
                    title: Text("Últimos 7 dias"),
                    onTap: () {
                      inicio = DateTime.now().subtract(Duration(days: 7));
                      pNome = 'Últimos 7 dias';

                      final df = new DateFormat('dd/MM/yyyy HH:mm');
                      periodo = "${df.format(inicio)} - ${df.format(fim)}";

                      Navigator.of(context).pop();
                      getData();
                    },
                  ),
                  ListTile(
                    title: Text("Últimos 30 dias"),
                    onTap: () {
                      inicio = DateTime.now().subtract(Duration(days: 30));
                      pNome = 'Últimos 30 dias';

                      final df = new DateFormat('dd/MM/yyyy HH:mm');
                      periodo = "${df.format(inicio)} - ${df.format(fim)}";

                      Navigator.of(context).pop();
                      getData();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
