import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../data/models/objective_model.dart';
import '../../home/home_controller.dart';

class ObjectivesController extends GetxController {
  final Isar _db = Get.find<HomeController>().database;

  Objective? lastObjective;

  final caloriesTEC = TextEditingController();
  final proteinsTEC = TextEditingController();
  final carbohydratesTEC = TextEditingController();
  final sugarsTEC = TextEditingController();
  final lipidsTEC = TextEditingController();
  final saturatedFatsTEC = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getLastObjective();

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
