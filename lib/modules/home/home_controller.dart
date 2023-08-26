import 'package:get/get.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  final bibi = 0.obs;

  void goToAliments() => Get.toNamed(aliments);
  void goToRecipes() => Get.toNamed(recipes);
  void goToJournal() => Get.toNamed(journal);
}
