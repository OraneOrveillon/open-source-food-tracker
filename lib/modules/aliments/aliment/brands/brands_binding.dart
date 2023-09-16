import 'package:get/get.dart';

import 'brands_controller.dart';

class BrandsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrandsController());
  }
}
