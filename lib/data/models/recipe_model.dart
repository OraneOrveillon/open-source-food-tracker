import 'package:isar/isar.dart';

import 'recipe_aliment_model.dart';

part 'recipe_model.g.dart';

@Collection()
class Recipe {
  Id id = Isar.autoIncrement;
  DateTime? creationDate;
  DateTime? updateDate;
  String? name;
  List<int>? image;
  List<String>? tags;
  String? link;
  int? portions;
  String? description;
  final IsarLinks<RecipeVariant> variants = IsarLinks();
}

@Collection()
class RecipeVariant {
  Id id = Isar.autoIncrement;
  String? name;
  bool? deleted;
  final IsarLinks<RecipeAliment> aliments = IsarLinks<RecipeAliment>();
}
