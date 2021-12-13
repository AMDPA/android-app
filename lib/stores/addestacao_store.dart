import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/models/estacao_model.dart';
import 'package:solotec/models/rede_model.dart';
import 'package:solotec/services/esp32connect.dart';
import 'package:solotec/services/firestore.dart';
import 'package:solotec/services/local.dart';
import 'package:solotec/services/permissoes.dart';
import 'package:solotec/services/rede.dart';
import 'package:flutter/material.dart';
part 'addestacao_store.g.dart';

class AddEstacaoStore = _AddEstacaoStoreBase with _$AddEstacaoStore;

abstract class _AddEstacaoStoreBase with Store {
  _AddEstacaoStoreBase({EstacaoModel? model}) {
    if (model != null) {
      nomeEstacao.text = model.name as String;
      descEstacao.text = model.description as String;
      ssidEstacao.text = model.localRede!.ssid as String;
      passEstacao.text = model.localRede!.password as String;
      operacEstacao = model.isRemote as bool
          ? ModoOperacionalEstacao.Remoto
          : ModoOperacionalEstacao.Local;
      edit = true;
      editM = model;
    }
    PermissoesManage().verifiquePermission();
  }

  final scaffold = GlobalKey<ScaffoldState>();
  final form = GlobalKey<FormState>();
  final form1 = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  List<EstacaoModel> estat = [];
  bool edit = false;
  EstacaoModel editM = EstacaoModel();

  @observable
  int currentStep = 0;

  @observable
  TextEditingController nomeEstacao = TextEditingController();

  @observable
  TextEditingController descEstacao = TextEditingController();

  @observable
  TextEditingController ssidEstacao = TextEditingController();

  @observable
  TextEditingController passEstacao = TextEditingController();

  @observable
  ModoOperacionalEstacao? operacEstacao = ModoOperacionalEstacao.Remoto;

  @observable
  Position? posiEstacao;

  @observable
  RedeModel? redeModel;

  @observable
  bool redeSel = false;

  @action
  modoOpTapped(ModoOperacionalEstacao? op) {
    operacEstacao = op;
  }

  @action
  tapped(int steep) {
    currentStep = steep;
  }

  @action
  configTappet() async {
    RedeManage.openWifiSettings();
    _loadDialog("Aguarde...");

    await Future.delayed(Duration(seconds: 30));

    redeModel = await RedeManage.getRedeInfo();
    redeSel = true;

    Navigator.of(scaffold.currentContext!).pop();

    await Future.delayed(Duration(seconds: 5));
    if (await ESP32Manage.isEstacao()) {
      currentStep += 1;
    } else {
      _erroDialog(
          'O dispositivo selecionado não corresponde a uma estação do projeto AMACPA ~ SOLOTEC\nTente com uma rede diferente!');
      redeSel = false;
    }
  }

  @action
  continued() async {
    if (currentStep == 1) return;
    if (currentStep == 2) {
      if (!form.currentState!.validate()) {
        return;
      }
    }
    if (currentStep == 3) {
      if (operacEstacao == ModoOperacionalEstacao.Remoto) {
        if (!form1.currentState!.validate()) {
          return;
        }
      }
      _config();
      return;
    }
    currentStep += 1;
    if (currentStep == 1) {
      posiEstacao = await LocalManager.getAtual();
    }
  }

  @action
  cancel() {
    if (currentStep == 0) return;
    if (currentStep == 1) {
      redeSel = false;
    }
    currentStep -= 1;
  }

  _config() async {
    List<EstacaoModel> estat = <EstacaoModel>[];

    int idee = 0;
    if (!edit) {
      idee = estat.length + 1;
    } else {
      idee = editM.id as int;
    }
    await FirestoreManage.getEstacao().then((value) => estat.addAll(value));

    _loadDialog("Aguarde enquanto configuramos a estação.");

    EstacaoModel es = EstacaoModel(
        id: idee,
        name: this.nomeEstacao.text,
        description: this.descEstacao.text,
        user: this._auth.currentUser!.uid,
        local: Local(
            longitude: posiEstacao!.longitude,
            latitude: posiEstacao!.latitude,
            timestamp: posiEstacao!.timestamp,
            accuracy: posiEstacao!.accuracy,
            altitute: posiEstacao!.altitude,
            heading: posiEstacao!.heading,
            speed: posiEstacao!.speed,
            speedAccuracy: posiEstacao!.speedAccuracy),
        isRemote:
            this.operacEstacao == ModoOperacionalEstacao.Remoto ? true : false,
        localRede: LocalRede(
            ssid: this.ssidEstacao.text, password: this.passEstacao.text),
        createdAt: edit ? editM.createdAt : DateTime.now());

    //FirebaseFirestore.instance.disableNetwork();

    if (await ESP32Manage.config(es)) {
      if (!edit) {
        FirestoreManage.setEstacao(es);
      } else {
        FirestoreManage.editEstacao(es);
      }
      Navigator.of(scaffold.currentContext!).pop();
    } else {
      Navigator.of(scaffold.currentContext!).pop();
      _erroDialog("Não foi possivel configurar a estação. Tente novamente!");
    }
    //FirebaseFirestore.instance.enableNetwork();

    Navigator.of(scaffold.currentContext!).pop();
  }

  /// COMPLEMENTO DE NAVEGAÇÃO
  _loadDialog(String msg) {
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
                CircularProgressIndicator(),
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
