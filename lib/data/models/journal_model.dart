import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'meal_model.dart';

part 'journal_model.g.dart';

@Collection(inheritance: false)
class Journal with EquatableMixin {
  Id id = Isar.autoIncrement;
  DateTime? date;
  final meals = IsarLinks<Meal>();

  @ignore
  @override
  List<Object?> get props => [date, meals];
}
