import 'package:isar/isar.dart';

part 'objective_model.g.dart';

@Collection()
class Objective {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime? creationDate;
  short? calories;
  double? proteins;
  double? carbohydrates;
  double? sugars;
  double? lipids;
  double? saturatedFats;
}
