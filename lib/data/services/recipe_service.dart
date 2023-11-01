import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../models/recipe_model.dart';
import '../providers/database_provider.dart';

class RecipeService {
  final Isar _db = Get.find<DatabaseProvider>().db;

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

  Future<List<String>> getAllTagsDistinct() async {
    final result =
        await _db.recipes.where().distinctByTags().tagsProperty().findAll();

    final Set<String> tagsSet = {};

    for (List<String>? tagsList in result) {
      if (tagsList != null) tagsSet.addAll(tagsList);
    }

    final List<String> tagsList = tagsSet.toList();
    tagsList.sort();

    return tagsList;
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
