import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../data/models/objective_model.dart';
import '../../home/home_controller.dart';

class ObjectivesController extends GetxController {
  final Isar _db = Get.find<HomeController>().database;

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
    await _getLastObjective();

    if (lastObjective?.calories != null) {
      caloriesTEC.text = lastObjective!.calories.toString();
    }
    if (lastObjective?.proteins != null) {
      proteinsTEC.text = lastObjective!.proteins.toString();
    }
    if (lastObjective?.carbohydrates != null) {
      carbohydratesTEC.text = lastObjective!.carbohydrates.toString();
    }
    if (lastObjective?.sugars != null) {
      sugarsTEC.text = lastObjective!.sugars.toString();
    }
    if (lastObjective?.lipids != null) {
      lipidsTEC.text = lastObjective!.lipids.toString();
    }
    if (lastObjective?.saturatedFats != null) {
      saturatedFatsTEC.text = lastObjective!.saturatedFats.toString();
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

      _putObjective(objective);
    }
  }

  Future<void> _getLastObjective() async {
    lastObjective =
        await _db.objectives.where().sortByCreationDateDesc().findFirst();
  }

  void _putObjective(Objective objective) async {
    _db.writeTxn(() async {
      await _db.objectives.put(objective);
    });
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
