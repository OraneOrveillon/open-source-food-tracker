import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../modules/home/home_controller.dart';
import '../models/aliment_model.dart';

class AlimentService {
  final Isar _db = Get.find<HomeController>().database;

  Future<List<Aliment>> getLastAlimentsWithOffset(
    int numberOfAliments,
    int offset,
  ) async {
    return await _db.aliments
        .where()
        .sortByCreationDateDesc()
        .offset(offset)
        .limit(numberOfAliments)
        .findAll();
  }

  Future<void> putAliment(Aliment aliment) async {
    _db.writeTxn(() async {
      await _db.aliments.put(aliment);
    });
  }

  Future<void> deleteAliment(Aliment aliment) async {
    _db.writeTxn(() async {
      await _db.aliments.delete(aliment.id);
    });
  }
}
