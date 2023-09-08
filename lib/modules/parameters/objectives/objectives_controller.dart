import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_template/data/services/objective_service.dart';
import 'package:get/get.dart';

import '../../../data/models/objective_model.dart';

class ObjectivesController extends GetxController {
  final ObjectiveService _service = ObjectiveService();

  Objective? lastObjective;

  final GlobalKey<FormState> formKey = GlobalKey();

  final caloriesTEC = TextEditingController();
  final proteinsTEC = TextEditingController();
  final carbohydratesTEC = TextEditingController();
  final sugarsTEC = TextEditingController();
  final lipidsTEC = TextEditingController();
  final saturatedFatsTEC = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    lastObjective = await _service.getLastObjective();

    if (lastObjective != null) {
      caloriesTEC.text = lastObjective!.calories!.toString();
      proteinsTEC.text = lastObjective!.proteins!.toString();
      carbohydratesTEC.text = lastObjective!.carbohydrates.toString();
      sugarsTEC.text = lastObjective!.sugars!.toString();
      lipidsTEC.text = lastObjective!.lipids!.toString();
      saturatedFatsTEC.text = lastObjective!.saturatedFats!.toString();
    }
  }

  void onValidateClick() async {
    if (formKey.currentState!.validate()) {
      final Objective objective = Objective()
        ..creationDate = DateTime.now()
        ..calories = int.parse(caloriesTEC.text)
        ..proteins = int.parse(proteinsTEC.text)
        ..carbohydrates = int.parse(carbohydratesTEC.text)
        ..sugars = int.parse(sugarsTEC.text)
        ..lipids = int.parse(lipidsTEC.text)
        ..saturatedFats = int.parse(saturatedFatsTEC.text);

      await _service.putObjective(objective);

      Get.back();
    }
  }

  @override
  void onClose() {
    super.onClose();
    caloriesTEC.dispose();
    proteinsTEC.dispose();
    carbohydratesTEC.dispose();
    sugarsTEC.dispose();
    lipidsTEC.dispose();
    saturatedFatsTEC.dispose();
  }
}
