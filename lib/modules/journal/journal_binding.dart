import 'package:get/get.dart';

import 'journal_controller.dart';

class JournalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JournalController());
  }
}
