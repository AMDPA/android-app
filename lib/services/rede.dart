import 'package:wifi_iot/wifi_iot.dart';

class RedeManage {
  Future<List<WifiNetwork>> getWiFi() async {
    await WiFiForIoTPlugin.loadWifiList().then((value) {
      _redesDisponiveis = value;
    });

    return _redesDisponiveis;
  }

  Stream<List<WifiNetwork>> getWiFiInRealTime() {
    return WiFiForIoTPlugin.onWifiScanResultReady;
  }

  Future<bool> connectWiFi(String nome, String senha) async {
    bool con;
    await WiFiForIoTPlugin.connect(nome,
            password: senha, security: NetworkSecurity.WPA)
        .then((value) => con = value);

    return con;
  }

  void disconnectWiFi() async {
    await WiFiForIoTPlugin.disconnect();
  }

  List<WifiNetwork> _redesDisponiveis;
}
