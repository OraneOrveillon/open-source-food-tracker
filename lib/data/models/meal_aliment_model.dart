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
  short? quantity;
  short? calories;
  float? proteins;
  float? carbohydrates;
  float? sugars;
  float? lipids;
  float? saturatedFat;
}
