import 'package:isar/isar.dart';

import 'meal_model.dart';

part 'journal_model.g.dart';

@Collection()
class Journal {
  Id id = Isar.autoIncrement;
  DateTime? date;
  final meals = IsarLinks<Meal>();
}
