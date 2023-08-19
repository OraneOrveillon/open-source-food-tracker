import 'package:get/get.dart';

import 'weighing_controller.dart';

class WeighingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeighingController());
  }
}
