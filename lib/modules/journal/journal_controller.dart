import 'package:get/get.dart';

import '../../routes/routes.dart';

class JournalController extends GetxController {
  void goToWeighings() => Get.toNamed(Routes.journal + Routes.weighings);
}
