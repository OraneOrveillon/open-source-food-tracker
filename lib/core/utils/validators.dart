import '../../data/models/recipe_aliment_model.dart';

abstract class Validators {
  static String? recipeAlimentsValidator(List<RecipeAliment>? value) {
    if (value == null || value.isEmpty) {
      return 'You should add at least one aliment to your recipe.';
    }
    return null;
  }
}
