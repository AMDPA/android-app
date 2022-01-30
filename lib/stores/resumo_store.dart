import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/models/medicoes_model.dart';
import 'package:solotec/services/firestore.dart';
import 'package:charts_flutter/flutter.dart' as charts;
part 'resumo_store.g.dart';

class ResumoStore = _ResumoStoreBase with _$ResumoStore;

abstract class _ResumoStoreBase with Store {
  _ResumoStoreBase() {
    getData();
  }
  @observable
  bool load = false;

  @observable
  String? atualizado = "Nunca";

  @observable
  double? ambienteTemperatura = 0;

  @observable
  double? ambienteUmidade = 0;

  @observable
  double? ambienteSensacao = 0;

  @observable
  double? soloTemperatura = 0;

  @observable
  double? soloUmidade = 0;

  @observable
  List<MedicoesModel> ultimasMedicoes = <MedicoesModel>[];

  @observable
  List<charts.Series<MedicoesModel, DateTime>> series =
      <charts.Series<MedicoesModel, DateTime>>[];

  getData() async {
    load = true;
    ultimasMedicoes = <MedicoesModel>[];
    series = <charts.Series<MedicoesModel, DateTime>>[];

    await FirestoreManage.getUltimaMedicao()
        .then((value) => ultimasMedicoes.addAll(value));

    ambienteTemperatura = ultimasMedicoes[0].dht11Temperatura;
    ambienteUmidade = ultimasMedicoes[0].dht11Umidade;
    ambienteSensacao = ultimasMedicoes[0].dht11IndiceCalor;

    soloTemperatura = ultimasMedicoes[0].a18b20Temperatura;
    soloUmidade = ultimasMedicoes[0].soilmoistureUmidade;

    DateTime data = DateTime.fromMillisecondsSinceEpoch(
        (ultimasMedicoes[0].hora!.toInt() * 1000).round());
    final df = new DateFormat('dd/MM/yyyy HH:mm ');
    atualizado = df.format(data);

    series.add(
      charts.Series(
          id: "CO2",
          data: ultimasMedicoes,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.ccs811Co2,
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault),
    );

    series.add(
      charts.Series(
          id: "H",
          data: ultimasMedicoes,
          domainFn: (MedicoesModel mm, _) =>
              DateTime.fromMillisecondsSinceEpoch(
                  (mm.hora!.toInt() * 1000).round()),
          measureFn: (MedicoesModel mm, _) => mm.mq8Hidrogenio,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    load = false;
  }
}
