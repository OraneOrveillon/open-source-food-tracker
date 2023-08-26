import 'package:get/get.dart';

import 'weighings_controller.dart';

class WeighingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeighingsController());
  }
}
