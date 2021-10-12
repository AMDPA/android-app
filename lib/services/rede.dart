import 'package:network_info_plus/network_info_plus.dart';
import 'package:open_settings/open_settings.dart';
import 'package:solotec/models/rede_model.dart';

class RedeManage {
  RedeManage._();

  static Future<void> openWifiSettings() async {
    await OpenSettings.openWIFISetting();
  }

  static Future<RedeModel> getRedeInfo() async {
    final info = NetworkInfo();
    var wifiName = await info.getWifiName();
    var wifiBSSID = await info.getWifiBSSID();
    var wifiIP = await info.getWifiIP();
    var wifiIPv6 = await info.getWifiIPv6();
    var wifiSubmask = await info.getWifiSubmask();
    var wifiBroadcast = await info.getWifiBroadcast();
    var wifiGateway = await info.getWifiGatewayIP();

    return RedeModel(
        wifiName: wifiName,
        wifiBSSID: wifiBSSID,
        wifiIP: wifiIP,
        wifiIPV6: wifiIPv6,
        wifiSubmask: wifiSubmask,
        wifiGateway: wifiGateway,
        wifiBroadcast: wifiBroadcast);
  }
}
