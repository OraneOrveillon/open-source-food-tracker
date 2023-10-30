import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../models/objective_model.dart';
import '../providers/database_provider.dart';

class ObjectiveService {
  final Isar _db = Get.find<DatabaseProvider>().db;

  Future<Objective?> getLastObjective() async {
    return await _db.objectives.where().sortByCreationDateDesc().findFirst();
  }

  Future<void> putObjective(Objective objective) async {
    _db.writeTxn(() async {
      await _db.objectives.put(objective);
    });
  }
}
