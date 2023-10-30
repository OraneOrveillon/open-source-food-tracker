import 'package:isar/isar.dart';

part 'objective_model.g.dart';

@Collection()
class Objective {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime? creationDate;
  int? calories;
  int? proteins;
  int? carbohydrates;
  int? sugars;
  int? lipids;
  int? saturatedFats;
}
