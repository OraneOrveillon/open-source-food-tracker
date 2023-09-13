import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../modules/home/home_controller.dart';
import '../models/recipe_model.dart';

class RecipeService {
  final Isar _db = Get.find<HomeController>().database;

  Future<List<Recipe>> getLastRecipesWithOffset(
    int numberOfRecipes,
    int offset,
  ) async {
    return await _db.recipes
        .where()
        .sortByCreationDateDesc()
        .offset(offset)
        .limit(numberOfRecipes)
        .findAll();
  }

  Future<void> putRecipe(Recipe recipe) async {
    _db.writeTxn(() async {
      await _db.recipes.put(recipe);
    });
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    _db.writeTxn(() async {
      await _db.recipes.delete(recipe.id);
    });
  }
}
