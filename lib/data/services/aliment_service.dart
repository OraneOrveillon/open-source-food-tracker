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

    final Set<String> brandsSet = {};

    for (List<String>? brandsList in result) {
      if (brandsList != null) brandsSet.addAll(brandsList);
    }

    final List<String> brandsList = brandsSet.toList();
    brandsList.sort();

    return brandsList;
  }

  Future<List<String>> getAllCategoriesDistinct() async {
    final result = await _db.aliments
        .where()
        .distinctByCategories()
        .categoriesProperty()
        .findAll();

    final Set<String> categoriesSet = {};

    for (List<String>? categoriesList in result) {
      if (categoriesList != null) categoriesSet.addAll(categoriesList);
    }

    final List<String> categoriesList = categoriesSet.toList();
    categoriesList.sort();

    return categoriesList;
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
