import 'package:get/get.dart';

import 'aliment_controller.dart';
import 'image_controller.dart';

class AlimentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlimentController());
    Get.lazyPut(() => ImageController());
  }
}
