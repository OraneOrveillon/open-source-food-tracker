import 'package:isar/isar.dart';

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
  final IsarLink<RecipeVariant> variants = IsarLink();
}

@Collection()
class RecipeVariant {
  Id id = Isar.autoIncrement;
  String? name;
  bool? deleted;
}
