import 'package:isar/isar.dart';

part 'recipe_model.g.dart';

@Collection()
class Recipe {
  final Id id;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final String? name;
  final List<String>? tags;
  final String? link;
  final int? portions;
  final String? description;
  final IsarLink<RecipeVariant> variants = IsarLink();

  Recipe({
    this.id = Isar.autoIncrement,
    this.creationDate,
    this.updateDate,
    this.name,
    this.tags,
    this.link,
    this.portions,
    this.description,
  });
}

@Collection()
class RecipeVariant {
  final Id id;
  final String? name;
  final bool? deleted;

  RecipeVariant({
    this.id = Isar.autoIncrement,
    this.name,
    this.deleted,
  });
}
