import 'package:get/get.dart';

import 'parameters_controller.dart';

class ParametersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ParametersController());
  }
}
