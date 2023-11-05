import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'aliment_model.dart';
import 'recipe_model.dart';

part 'recipe_aliment_model.g.dart';

@Collection(inheritance: false)
class RecipeAliment with EquatableMixin {
  Id id = Isar.autoIncrement;
  final recipe = IsarLink<RecipeVariant>();
  final aliment = IsarLink<Aliment>();
  String? dose;
  int? quantity;
  int? calories;
  double? proteins;
  double? carbohydrates;
  double? sugars;
  double? lipids;
  double? saturatedFats;

  @ignore
  @override
  List<Object?> get props => [
        aliment,
        dose,
        quantity,
      ];
}
