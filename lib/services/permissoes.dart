import 'package:permission_handler/permission_handler.dart';

class PermissoesManage {
  verifiquePermission() async {
    //Local
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    } else if (await Permission.location.isPermanentlyDenied) {
      await Permission.location.shouldShowRequestRationale;
      openAppSettings();
    }

    //Armazenamento
    var status2 = await Permission.storage.status;
    if (status2.isDenied) {
      await Permission.storage.request();
    } else if (status2.isPermanentlyDenied) {
      await Permission.storage.shouldShowRequestRationale;
      openAppSettings();
    }
  }
}
