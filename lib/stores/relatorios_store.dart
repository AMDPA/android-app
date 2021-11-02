import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:solotec/models/relatorios_model.dart';
import 'package:solotec/pages/gerarrelatorio_page.dart';
import 'package:solotec/services/firestore.dart';
import 'package:solotec/services/relatorios.dart';
part 'relatorios_store.g.dart';

class RelatoriosStore = _RelatoriosStoreBase with _$RelatoriosStore;

abstract class _RelatoriosStoreBase with Store {
  _RelatoriosStoreBase() {
    getRelatorio();
  }

  @observable
  bool load = false;

  @observable
  List<RelatoriosModel> modelR = [];

  @observable
  List<int> modelD = [];

  @observable
  double progress = 0;

  getRelatorio() async {
    load = true;
    modelR = <RelatoriosModel>[];
    modelD = <int>[];

    await FirestoreManage.getRelatorio().then((value) async {
      for (var item in value) {
        modelR.add(item);
        if (await RelatoriosService.relatorioExiste(item.url!)) {
          modelD.add(-1);
        } else {
          modelD.add(1);
        }
      }
    });
    load = false;
  }

  @action
  criarRelatorio(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GerarRelatorioPage()));
    getRelatorio();
  }

  @action
  openRelatorio(int i, BuildContext ctx) async {
    if (modelD[i] == -1) {
      await RelatoriosService.openRelatorio(modelR[i].url!);
    } else {
      _loadDialog("BAIXANDO RELATORIO", ctx);
      bool d =
          await RelatoriosService.downloadRelatorio(modelR[i].url!, (r, t) {
        progress = (r / t);
      });

      Navigator.of(ctx).pop();
      if (d) {
        await RelatoriosService.openRelatorio(modelR[i].url!);
        getRelatorio();
      } else {
        _erroDialog("Não foi posivel concluir o download", ctx);
      }
    }
  }

  /// COMPLEMENTO DE NAVEGAÇÃO
  _loadDialog(String msg, BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
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
                    return CircularPercentIndicator(
                      progressColor: Colors.brown,
                      fillColor: Colors.white38,
                      percent: progress,
                      radius: 50,
                    );
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

  _erroDialog(String erro, BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
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
