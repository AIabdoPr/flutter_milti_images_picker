import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  RxList<XFile> images = <XFile>[].obs;

  checkPermissions() async {
    if (await Permission.storage.status.isGranted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.camera,
        Permission.accessMediaLocation,
        Permission.photos
      ].request();
    }
  }

  pickImages() async {
    List<XFile> images = await ImagePicker().pickMultiImage();
    log(images.toString());

    if (images.isNotEmpty) {
      this.images.value = images;
      update();
    }
  }

  upload() {}
}
