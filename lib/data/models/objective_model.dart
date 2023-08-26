import 'package:isar/isar.dart';

part 'objective_model.g.dart';

@Collection()
class Objective {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime? creationDate;
  short? calories;
  float? proteins;
  float? carbohydrates;
  float? sugars;
  float? lipids;
  float? saturatedFats;
}
