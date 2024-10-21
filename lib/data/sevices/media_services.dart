import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaServices {
  static Future<String> pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        return pickedImage.path;
      } else {
        return '';
      }
      // PermissionStatus status = await Permission.storage.status;
      // if (status == PermissionStatus.granted) {
      //   final pickedImage =
      //       await ImagePicker().pickImage(source: ImageSource.gallery);
      //   if (pickedImage != null) {
      //     return pickedImage.path;
      //   } else {
      //     return '';
      //   }
      // } else if (status == PermissionStatus.permanentlyDenied
      //     ) {
      //   openAppSettings();
      //   return '';
      // } else {
      //   await Permission.storage.request();
      //   return '';
      // }
    } catch (e) {
      print(e);
      return '';
    }
  }
}
