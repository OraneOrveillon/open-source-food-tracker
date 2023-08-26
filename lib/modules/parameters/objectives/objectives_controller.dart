import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../data/models/objective_model.dart';
import '../../home/home_controller.dart';

class ObjectivesController extends GetxController {
  final Isar _db = Get.find<HomeController>().database;

  Objective? lastObjective;

  final caloriesTEC = TextEditingController().obs;
  final proteinsTEC = TextEditingController().obs;
  final carbohydratesTEC = TextEditingController().obs;
  final sugarsTEC = TextEditingController().obs;
  final lipidsTEC = TextEditingController().obs;
  final saturatedFatsTEC = TextEditingController().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getLastObjective();

    if (lastObjective?.calories != null) {
      caloriesTEC.value.text = lastObjective!.calories.toString();
    }
    if (lastObjective?.proteins != null) {
      proteinsTEC.value.text = lastObjective!.proteins.toString();
    }
    if (lastObjective?.carbohydrates != null) {
      carbohydratesTEC.value.text = lastObjective!.carbohydrates.toString();
    }
    if (lastObjective?.sugars != null) {
      sugarsTEC.value.text = lastObjective!.sugars.toString();
    }
    if (lastObjective?.lipids != null) {
      lipidsTEC.value.text = lastObjective!.lipids.toString();
    }
    if (lastObjective?.saturatedFats != null) {
      saturatedFatsTEC.value.text = lastObjective!.saturatedFats.toString();
    }
  }

  Future<void> getLastObjective() async {
    lastObjective =
        await _db.objectives.where().sortByCreationDateDesc().findFirst();
  }

  void putObjective(Objective objective) {
    _db.writeTxn(() async {
      await _db.objectives.put(objective);
    });
  }
}
