import 'package:get/get.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  void goToAliments() => Get.toNamed(Routes.aliments);
  void goToRecipes() => Get.toNamed(Routes.recipes);
  void goToJournal() => Get.toNamed(Routes.journal);
  void goToParameters() => Get.toNamed(Routes.parameters);
}
