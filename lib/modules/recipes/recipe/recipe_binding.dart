import 'package:get/get.dart';

import 'recipe_controller.dart';

class RecipeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecipeController());
  }
}
