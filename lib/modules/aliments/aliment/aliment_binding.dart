import 'package:get/get.dart';

import 'aliment_controller.dart';

class AlimentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlimentController());
  }
}
