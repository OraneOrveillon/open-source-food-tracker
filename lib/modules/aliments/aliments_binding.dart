import 'package:get/get.dart';

import 'aliments_controller.dart';

class AlimentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlimentsController());
  }
}
