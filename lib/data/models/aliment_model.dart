import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'aliment_model.g.dart';

@Collection(inheritance: false)
class Aliment with EquatableMixin {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime? creationDate;
  DateTime? updateDate;
  bool? deleted;
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
  List<Dose>? doses;

  Aliment copyWith({
    required String? name,
    required String? barcode,
    required List<String>? brands,
    required List<String>? categories,
    required String? nutriscore,
    required String? image,
    required String? unit,
    required double? servingQuantity,
    required int? calories,
    required double? proteins,
    required double? carbohydrates,
    required double? sugars,
    required double? lipids,
    required double? saturatedFats,
    required List<Dose>? doses,
  }) =>
      Aliment()
        ..id = id
        ..creationDate = creationDate
        ..updateDate = updateDate
        ..deleted = deleted
        ..name = name
        ..barcode = barcode
        ..brands = brands
        ..categories = categories
        ..nutriscore = nutriscore
        ..image = image
        ..unit = unit
        ..servingQuantity = servingQuantity
        ..calories = calories
        ..proteins = proteins
        ..carbohydrates = carbohydrates
        ..sugars = sugars
        ..lipids = lipids
        ..saturatedFats = saturatedFats
        ..doses = doses;

  @ignore
  @override
  List<Object?> get props => [
        name,
        barcode,
        brands,
        categories,
        nutriscore,
        image,
        unit,
        servingQuantity,
        calories,
        proteins,
        carbohydrates,
        sugars,
        lipids,
        saturatedFats,
        doses
      ];
}

@Embedded(inheritance: false)
class Dose with EquatableMixin {
  String? name;
  double? equivalent;

  @ignore
  @override
  List<Object?> get props => [name, equivalent];
}
