import 'package:isar/isar.dart';

part 'weighing_model.g.dart';

@Collection()
class Weighing {
  Id id = Isar.autoIncrement;
  DateTime? date;
  double? value;
}
