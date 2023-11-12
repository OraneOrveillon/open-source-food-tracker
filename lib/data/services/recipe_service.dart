import 'package:flutter_template/data/models/recipe_aliment_model.dart';
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

  // FIXME, changer, ne marche que si on a qu'une seule variante
  Future<void> putRecipe({
    required Recipe recipe,
    required List<RecipeVariant> recipeVariants,
    required List<RecipeAliment> recipeAliments,
  }) async {
    _db.writeTxn(() async {
      await _db.recipes.put(recipe);
      await _db.recipeVariants.putAll(recipeVariants);
      await _db.recipeAliments.putAll(recipeAliments);

      await recipe.variants.save();
      for (final recipeVariant in recipeVariants) {
        await recipeVariant.aliments.save();
      }
      for (final recipeAliment in recipeAliments) {
        await recipeAliment.aliment.save();
      }
    });
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    _db.writeTxn(() async {
      await _db.recipes.delete(recipe.id);
    });
  }
}
