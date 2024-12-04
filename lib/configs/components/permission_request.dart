import 'package:permission_handler/permission_handler.dart';
import 'package:picscape/configs/utils/utils.dart';

Future<bool> requestPermissions(context) async {
  PermissionStatus permission = await Permission.mediaLibrary.request();
  if (permission.isDenied) {
    permission = await Permission.mediaLibrary.request();
    if (permission.isPermanentlyDenied) {
      Utils.flushBarMessage(
        'Permission is permanently denied. Please enable it in the app settings.',
        context,
      );
      await openAppSettings();
      return false;
    } else if (permission.isDenied) {
      Utils.flushBarMessage('Permission denied.', context);
      return false;
    } else {
      Utils.flushBarMessage('Permission denied.', context);
      return false;
    }
  } else {
    return true;
  }
}
