import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  final Rx<Uint8List?> image = Rx(null);

  Future<void> pickImage(ImageSource value) async {
    final XFile? picture = await _imagePicker.pickImage(source: value);
    if (picture != null) {
      image.value = await picture.readAsBytes();
    }
  }

  void removeImage() => image.value = null;
}
