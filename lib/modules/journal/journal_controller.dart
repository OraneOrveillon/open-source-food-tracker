import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../routes/routes.dart';
import '../home/home_controller.dart';

class JournalController extends GetxController {
  final Isar _db = Get.find<HomeController>().database;

  void goToWeighings() => Get.toNamed(journal + weighings);
}
