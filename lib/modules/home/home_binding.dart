import '../../data/providers/database_provider.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.putAsync(() => DatabaseProvider().init());
    Get.lazyPut(() => HomeController());
  }
}
