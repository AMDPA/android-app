import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/models/estacao_model.dart';
import 'package:solotec/pages/addestacao_page.dart';
import 'package:solotec/pages/verestacao_page.dart';
import 'package:solotec/services/firestore.dart';
part 'estacoes_store.g.dart';

class EstacoesStore = _EstacoesStoreBase with _$EstacoesStore;

abstract class _EstacoesStoreBase with Store {
  _EstacoesStoreBase() {
    getEstacoes();
  }

  @observable
  List<EstacaoModel> estat = <EstacaoModel>[];

  @observable
  bool atuali = false;

  @action
  getEstacoes() async {
    atuali = true;
    estat = <EstacaoModel>[];
    await FirestoreManage.getEstacao().then((value) => estat.addAll(value));

    atuali = false;
  }

  @action
  openAddEstacoes(BuildContext context) async {
    if (estat.length == 0) {
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddEstacaoPage()));
      getEstacoes();
    } else {
      //inf
    }
  }

  @action
  openVerEstacoes(BuildContext context, int i) async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => VerEstacaoPage(estat[i])));
    getEstacoes();
  }
}
