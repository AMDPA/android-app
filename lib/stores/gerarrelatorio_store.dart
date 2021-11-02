import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:solotec/models/relatorios_model.dart';
import 'package:solotec/services/firestore.dart';
import 'package:solotec/services/relatorios.dart';
part 'gerarrelatorio_store.g.dart';

class GerarRelatorioStore = _GerarRelatorioStoreBase with _$GerarRelatorioStore;

abstract class _GerarRelatorioStoreBase with Store {
  DateTime? inicio, hfinal, getI, getF;
  TimeOfDay? hhoraI, hhoraF;
  final form = GlobalKey<FormState>();
  final scaffold = GlobalKey<ScaffoldState>();

  @observable
  double progress = 0;

  @observable
  TextEditingController dataI = TextEditingController();
  @observable
  TextEditingController dataF = TextEditingController();
  @observable
  TextEditingController horaI = TextEditingController();
  @observable
  TextEditingController horaF = TextEditingController();
  @observable
  TextEditingController desc = TextEditingController();

  @action
  gerar() async {
    _loadDialog("GERANDO RELATÓRIO", false);

    inicio = DateTime(
        getI!.year, getI!.month, getI!.day, hhoraI!.hour, hhoraI!.minute);
    hfinal = DateTime(
        getF!.year, getF!.month, getF!.day, hhoraF!.hour, hhoraF!.minute);

    String url = await RelatoriosService.newRelatorio(inicio!, hfinal!);

    RelatoriosModel m = RelatoriosModel(
        dataInicial: (inicio!.millisecondsSinceEpoch / 1000).round(),
        dataFinal: (hfinal!.millisecondsSinceEpoch / 1000).round(),
        url: url,
        descri: desc.text);

    await FirestoreManage.setRelatorio(m);
    Navigator.of(scaffold.currentContext!).pop();

    _loadDialog("BAIXANDO RELATÓRIO", true);

    bool d = await RelatoriosService.downloadRelatorio(url, (r, t) {
      progress = (r / t);
    });
    Navigator.of(scaffold.currentContext!).pop();
    if (d) {
      Navigator.of(scaffold.currentContext!).pop();
    } else {
      _erroDialog("Não foi posivel concluir o download");
    }
  }

  /// COMPLEMENTO DE NAVEGAÇÃO
  _loadDialog(String msg, bool down) {
    showDialog(
      barrierDismissible: false,
      context: scaffold.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    return down
                        ? CircularPercentIndicator(
                            progressColor: Colors.brown,
                            fillColor: Colors.white38,
                            percent: progress,
                            radius: 50,
                          )
                        : CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  msg,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _erroDialog(String erro) {
    showDialog(
      barrierDismissible: false,
      context: scaffold.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('ERRO')),
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  erro,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK')),
          ],
        );
      },
    );
  }
}
