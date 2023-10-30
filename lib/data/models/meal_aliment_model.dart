import 'package:isar/isar.dart';

import 'aliment_model.dart';
import 'meal_model.dart';

part 'meal_aliment_model.g.dart';

@Collection()
class MealAliment {
  Id id = Isar.autoIncrement;
  final meal = IsarLink<Meal>();
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
