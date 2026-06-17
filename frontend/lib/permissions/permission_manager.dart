import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  Future<bool>
      microphone() async {

    final status =
        await Permission.microphone
            .request();

    return status.isGranted;
  }
}
