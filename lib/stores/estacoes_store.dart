import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/models/estacao_model.dart';
import 'package:solotec/pages/addestacao_page.dart';
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
}

 //MEDIÇÕES
                      /*DateTime data = DateTime.now();
                        CollectionReference<MedicoesModel> medModel = store.db
                            .collection('usuario_teste')
                            .doc('Dados')
                            .collection(
                                '${data.year}-${data.month}-${data.day}')
                            .withConverter(
                                fromFirestore: (json, _) =>
                                    MedicoesModel.fromJson(json.data()),
                                toFirestore: (MedicoesModel json, _) =>
                                    json.toJson());
                        medModel
                            .doc(
                                '${data.hour}:${data.minute}:${data.microsecond}')
                            .set(MedicoesModel(
                                cjmcu: 100,
                                hidrogenio: 100,
                                hora: Timestamp.fromDate(data),
                                id: 0,
                                luminosidade: 100,
                                temperatura: 100,
                                umidade: 100,
                                uuid: "sssssssss"));
                        medModel.get().then((value) {
                          for (QueryDocumentSnapshot item in value.docs) {
                            MedicoesModel m = item.data() as MedicoesModel;
                            print(m.toJson());
                          }
                        });

                        //ESTACOES
                        CollectionReference<EstacaoModel> estModel = store.db
                            .collection('usuario_teste')
                            .doc('Estacoes')
                            .collection('itens')
                            .withConverter(
                                fromFirestore: (json, _) =>
                                    EstacaoModel.fromJson(json.data()),
                                toFirestore: (EstacaoModel json, _) =>
                                    json.toJson());

                        //SET
                        estModel.doc().set(
                            EstacaoModel(
                                createdAt: Timestamp.now(),
                                localizacao: GeoPoint(10, 10),
                                name: 'Teste4',
                                updateAt: Timestamp.now()),
                            SetOptions(merge: true));

                        //GET
                        estModel.get().then((value) {
                          for (QueryDocumentSnapshot item in value.docs) {
                            EstacaoModel m = item.data() as EstacaoModel;
                            print(m.toJson());
                          }
                        });*/