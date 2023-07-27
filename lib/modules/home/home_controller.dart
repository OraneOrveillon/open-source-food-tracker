import 'package:get/get.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  void onClick() => Get.toNamed(dog);
}
