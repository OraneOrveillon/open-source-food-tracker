import 'package:isar/isar.dart';

part 'aliment_model.g.dart';

@Collection()
class Aliment {
  Id id = Isar.autoIncrement;
  DateTime? creationDate;
  DateTime? updateDate;
  String? name;
  String? barcode;
  List<String>? brands;
  List<String>? categories;
  String? nutriscore;
  String? image;
  String? unit;
  double? servingQuantity;
  int? calories;
  double? proteins;
  double? carbohydrates;
  double? sugars;
  double? lipids;
  double? saturatedFats;
  bool? deleted;
  List<Dose>? doses;
}

@Embedded()
class Dose {
  String? name;
  double? equivalent;
}
