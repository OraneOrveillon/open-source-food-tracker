import 'package:get/get.dart';

import '../../routes/routes.dart';

class JournalController extends GetxController {
  final bibi = 0.obs;

  void goToWeighings() => Get.toNamed(journal + weighings);
}
