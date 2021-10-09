import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/models/estacao_model.dart';
import 'package:solotec/services/esp32connect.dart';
import 'package:solotec/services/firestore.dart';
import 'package:solotec/services/local.dart';
import 'package:solotec/services/permissoes.dart';
import 'package:solotec/services/rede.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/material.dart';
part 'addestacao_store.g.dart';

class AddEstacaoStore = _AddEstacaoStoreBase with _$AddEstacaoStore;

abstract class _AddEstacaoStoreBase with Store {
  _AddEstacaoStoreBase() {
    PermissoesManage().verifiquePermission();
  }

  final scaffold = GlobalKey<ScaffoldState>();
  final form = GlobalKey<FormState>();
  final form1 = GlobalKey<FormState>();

  WifiNetwork _connected;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  int currentStep = 0;

  @observable
  List<WifiNetwork> redes;

  @observable
  TextEditingController nomeEstacao = TextEditingController();

  @observable
  TextEditingController descEstacao = TextEditingController();

  @observable
  TextEditingController ssidEstacao = TextEditingController();

  @observable
  TextEditingController passEstacao = TextEditingController();

  @observable
  ModoOperacionalEstacao operacEstacao = ModoOperacionalEstacao.Local;

  @observable
  Position posiEstacao;

  @action
  modoOpTapped(ModoOperacionalEstacao op) {
    operacEstacao = op;
    if (operacEstacao == ModoOperacionalEstacao.Local) {
      ssidEstacao.text = _connected.ssid;
      passEstacao.text = 'nqad7601';
    } else {
      ssidEstacao.text = "";
      passEstacao.text = "";
    }
  }

  @action
  tapped(int steep) {
    currentStep = steep;
  }

  @action
  redeTapped(int t) async {
    await RedeManage()
        .connectWiFi(redes[t].ssid, 'HNCE5C10')
        .then((value) async {
      if (value) {
        await ESP32Manage().isEstacao().then((value2) {
          if (value2) {
            _connected = redes[t];
            nomeEstacao.text = _connected.ssid;
            descEstacao.text = "Estação " + _connected.ssid;
            currentStep += 1;
          } else {
            _erroDialog();
            RedeManage().disconnectWiFi();
          }
        });
      }
    });
  }

  @action
  continued() {
    if (currentStep == 1) return;
    if (currentStep == 2) {
      if (!form.currentState.validate()) {
        return;
      }
    }
    if (currentStep == 3) {
      if (!form1.currentState.validate()) {
        return;
      }
      _config();
      return;
    }
    currentStep += 1;
    if (currentStep == 1) {
      LocalManager().getAtual().then((value) => posiEstacao = value);
      RedeManage().getWiFi().then((value) => redes = value);
    }
  }

  @action
  cancel() {
    if (currentStep == 0) return;
    currentStep -= 1;
  }

  _config() async {
    _loadDialog();
    EstacaoModel es = EstacaoModel(
        name: this.nomeEstacao.text,
        description: this.descEstacao.text,
        local: this.posiEstacao,
        modoOP: this.operacEstacao,
        apSsid: this.ssidEstacao.text,
        apPass: this.passEstacao.text,
        createdAt: DateTime.now());

    await ESP32Manage().config(es).then((value) {
      Navigator.of(scaffold.currentContext).pop();
      if (value) {
        FirestoreManage()
            .getC(_auth.currentUser.uid, 'Estacoes', 'itens')
            .doc()
            .set(es);
        RedeManage().disconnectWiFi();
      } else {
        _erroDialog();
        return;
      }

      Navigator.of(scaffold.currentContext).pop();
    });
  }

  /// COMPLEMENTO DE NAVEGAÇÃO
  _loadDialog() {
    showDialog(
      barrierDismissible: false,
      context: scaffold.currentContext,
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
                  'Aguarde enquanto configuramos a estação',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _erroDialog() {
    showDialog(
      barrierDismissible: false,
      context: scaffold.currentContext,
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
                  'O dispositivo selecionado não corresponde a uma estação do projeto AMACPA ~ SOLOTEC\nTente com uma rede diferente!',
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
