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
  }
}
