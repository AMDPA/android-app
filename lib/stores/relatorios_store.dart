import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
  openRelatorio(int i) async {
    if (modelD[i] == -1) {
      await RelatoriosService.openRelatorio(modelR[i].url!);
    } else {
      //O ITEM TA BAIXANDO AINDA;
    }
  }
}
