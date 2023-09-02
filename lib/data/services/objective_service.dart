import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../modules/home/home_controller.dart';
import '../models/objective_model.dart';

class ObjectiveService {
  final Isar _db = Get.find<HomeController>().database;

  Future<Objective?> getLastObjective() async {
    return await _db.objectives.where().sortByCreationDateDesc().findFirst();
  }

  Future<void> putObjective(Objective objective) async {
    _db.writeTxn(() async {
      await _db.objectives.put(objective);
    });
  }
}
