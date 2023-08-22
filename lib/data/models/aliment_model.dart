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
  float? servingQuantity;
  short? calories;
  float? proteins;
  float? carbohydrates;
  float? sugars;
  float? lipids;
  float? saturatedFat;
  bool? deleted;
  List<Dose>? doses;
}

@Embedded()
class Dose {
  String? name;
  float? equivalent;
}
