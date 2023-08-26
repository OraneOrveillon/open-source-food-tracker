import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../data/models/objective_model.dart';
import '../../home/home_controller.dart';

class ObjectivesController extends GetxController {
  final objectives = [].obs;

  final Isar _db = Get.find<HomeController>().database;
  late final StreamSubscription _objectiveChanged;

  @override
  Future<void> onInit() async {
    super.onInit();

    _objectiveChanged = _db.objectives.watchLazy().listen((event) async {
      await getAllObjectives();
    });

    await getAllObjectives();
  }

  Future<void> getAllObjectives() async {
    objectives.value = await _db.objectives.where().findAll();
  }

  void putObjective(Objective objective) {
    _db.writeTxn(() async {
      await _db.objectives.put(objective);
    });
  }

  void deleteObjective(Objective objective) {
    _db.writeTxn(() async {
      await _db.objectives.delete(objective.id);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _objectiveChanged.cancel();
  }
}
