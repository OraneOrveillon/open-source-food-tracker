import 'package:flutter_template/data/providers/database_provider.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  late Isar database;

  @override
  Future<void> onInit() async {
    super.onInit();

    database = await DatabaseProvider.getInstance();
  }

  void goToAliments() => Get.toNamed(aliments);
  void goToRecipes() => Get.toNamed(recipes);
  void goToJournal() => Get.toNamed(journal);
}
