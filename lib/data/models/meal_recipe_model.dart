import 'package:isar/isar.dart';

import 'meal_model.dart';
import 'recipe_model.dart';

part 'meal_recipe_model.g.dart';

@Collection()
class MealRecipe {
  Id id = Isar.autoIncrement;
  final meal = IsarLink<Meal>();
  final recipe = IsarLink<Recipe>();
  float? portions;
  float? calories;
  float? proteins;
  float? carbohydrates;
  float? sugars;
  float? lipids;
  float? saturatedFat;
}
