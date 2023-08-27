import 'package:isar/isar.dart';

part 'recipe_model.g.dart';

@Collection()
class Recipe {
  Id id = Isar.autoIncrement;
  DateTime? creationDate;
  DateTime? updateDate;
  String? name;
  List<String>? tags;
  int? portions;
  String? description;
  bool? deleted;
}
