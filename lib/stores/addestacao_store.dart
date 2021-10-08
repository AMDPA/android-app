import 'package:mobx/mobx.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/services/esp32connect.dart';
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
  WifiNetwork _connected;

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
        .connectWiFi(redes[t].ssid, 'nqad7601')
        .then((value) async {
      if (value) {
        await ESP32Manage().isEstacao().then((value2) {
          if (value2) {
            _connected = redes[t];
            nomeEstacao.text = _connected.ssid;
            descEstacao.text = "Estação " + _connected.ssid;
            currentStep += 1;
          } else {
            ScaffoldMessenger.of(scaffold.currentContext).showSnackBar(SnackBar(
                content: Text(
                    'A rede selecionada não corresponde a uma estação. Tente novamente!')));
          }
        });
      }
    });
  }

  @action
  continued() {
    if (currentStep == 1) return;

    if (currentStep == 3) {
      _loadDialog();
      return;
    }

    currentStep += 1;
    if (currentStep == 1) {
      RedeManage()
          .getWiFiInRealTime()
          .asObservable()
          .listen((event) => redes = event);
      // RedeManage().getWiFiInRealTime().forEach((element) => redes = element);
      // RedeManage().getWiFi().then((value) => redes = value);
    }
  }

  @action
  cancel() {
    if (currentStep == 0) return;
    currentStep -= 1;
  }

  /// COMPLEMENTO DE NAVEGAÇÃO
  _loadDialog() {
    showDialog(
      barrierDismissible: false,
      context: scaffold.currentContext,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }
}

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      //actions: ,
    );
  }
}