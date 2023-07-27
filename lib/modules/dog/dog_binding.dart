import 'package:get/get.dart';

import 'dog_controller.dart';

class DogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DogController());
  }
}
