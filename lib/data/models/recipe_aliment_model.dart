import 'package:isar/isar.dart';

import 'aliment_model.dart';
import 'recipe_model.dart';

part 'recipe_aliment_model.g.dart';

@Collection()
class RecipeAliment {
  Id id = Isar.autoIncrement;
  final recipe = IsarLink<Recipe>();
  final aliment = IsarLink<Aliment>();
  String? dose;
  short? quantity;
  short? calories;
  double? proteins;
  double? carbohydrates;
  double? sugars;
  double? lipids;
  double? saturatedFats;
}
