import 'objectives_controller.dart';
import 'package:get/get.dart';

class ObjectivesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ObjectivesController());
  }
}
