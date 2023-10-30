import 'package:isar/isar.dart';

part 'weighing_model.g.dart';

@Collection()
class Weighing {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime? date;
  double? value;
}
