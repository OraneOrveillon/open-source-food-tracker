import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'aliment_model.g.dart';

@Collection()
class Aliment with EquatableMixin {
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

  Aliment copyWith({
    DateTime? creationDate,
    DateTime? updateDate,
    String? name,
    String? barcode,
    List<String>? brands,
    List<String>? categories,
    String? nutriscore,
    String? image,
    String? unit,
    double? servingQuantity,
    int? calories,
    double? proteins,
    double? carbohydrates,
    double? sugars,
    double? lipids,
    double? saturatedFats,
    bool? deleted,
    List<Dose>? doses,
  }) =>
      Aliment()
        ..id = id
        ..creationDate = creationDate ?? this.creationDate
        ..updateDate = updateDate ?? this.updateDate
        ..name = name ?? this.name
        ..barcode = barcode ?? this.barcode
        ..brands = brands ?? this.brands
        ..categories = categories ?? this.categories
        ..nutriscore = nutriscore ?? this.nutriscore
        ..image = image ?? this.image
        ..unit = unit ?? this.unit
        ..servingQuantity = servingQuantity ?? this.servingQuantity
        ..calories = calories ?? this.calories
        ..proteins = proteins ?? this.proteins
        ..carbohydrates = carbohydrates ?? this.carbohydrates
        ..sugars = sugars ?? this.sugars
        ..lipids = lipids ?? this.lipids
        ..saturatedFats = saturatedFats ?? this.saturatedFats
        ..deleted = deleted ?? this.deleted
        ..doses = doses ?? this.doses;
}

@Embedded()
class Dose with EquatableMixin {
  String? name;
  double? equivalent;

  @override
  List<Object?> get props => [name, equivalent];
}
