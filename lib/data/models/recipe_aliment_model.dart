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
  int? quantity;
  int? calories;
  double? proteins;
  double? carbohydrates;
  double? sugars;
  double? lipids;
  double? saturatedFats;
}
