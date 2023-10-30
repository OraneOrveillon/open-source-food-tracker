import 'package:isar/isar.dart';

part 'meal_model.g.dart';

@Collection()
class Meal {
  Id id = Isar.autoIncrement;
  String? type;
}
