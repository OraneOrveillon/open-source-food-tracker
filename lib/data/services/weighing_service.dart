import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../modules/home/home_controller.dart';
import '../models/weighing_model.dart';

class WeighingService {
  final Isar _db = Get.find<HomeController>().database;

  Future<List<Weighing>> getLastWeighingsWithOffset(
    int numberOfWeighings,
    int offset,
  ) async {
    return await _db.weighings
        .where()
        .sortByDateDesc()
        .offset(offset)
        .limit(numberOfWeighings)
        .findAll();
  }

  Future<void> putWeighing(Weighing weighing) async {
    _db.writeTxn(() async {
      await _db.weighings.put(weighing);
    });
  }

  Future<void> deleteWeighing(Weighing weighing) async {
    _db.writeTxn(() async {
      await _db.weighings.delete(weighing.id);
    });
  }
}
