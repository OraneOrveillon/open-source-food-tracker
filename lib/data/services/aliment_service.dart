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

  Future<List<String>> getAllBrandsDistinct() async {
    final result = await _db.aliments
        .where()
        .distinctByBrands()
        .brandsProperty()
        .findAll();

    final Set<String> brands = {};

    for (List<String>? brandsList in result) {
      if (brandsList != null) brands.addAll(brandsList);
    }

    return brands.toList();
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
