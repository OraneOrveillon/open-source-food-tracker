import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'aliment_model.g.dart';

@Collection(inheritance: false)
class Aliment extends Equatable {
  final Id id;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final bool? deleted;
  final String? name;
  final String? barcode;
  final List<String>? brands;
  final List<String>? categories;
  final String? nutriscore;
  final String? image;
  final String? unit;
  final double? servingQuantity;
  final int? calories;
  final double? proteins;
  final double? carbohydrates;
  final double? sugars;
  final double? lipids;
  final double? saturatedFats;
  final List<Dose>? doses;

  const Aliment({
    this.id = Isar.autoIncrement,
    this.creationDate,
    this.updateDate,
    this.deleted,
    this.name,
    this.barcode,
    this.brands,
    this.categories,
    this.nutriscore,
    this.image,
    this.unit,
    this.servingQuantity,
    this.calories,
    this.proteins,
    this.carbohydrates,
    this.sugars,
    this.lipids,
    this.saturatedFats,
    this.doses,
  });

  Aliment copyWith({
    required DateTime? updateDate,
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
      Aliment(
        id: id,
        creationDate: creationDate,
        updateDate: updateDate,
        deleted: deleted,
        name: name,
        barcode: barcode,
        brands: brands,
        categories: categories,
        nutriscore: nutriscore,
        image: image,
        unit: unit,
        servingQuantity: servingQuantity,
        calories: calories,
        proteins: proteins,
        carbohydrates: carbohydrates,
        sugars: sugars,
        lipids: lipids,
        saturatedFats: saturatedFats,
        doses: doses,
      );

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
class Dose extends Equatable {
  final String? name;
  final double? equivalent;

  const Dose({this.name, this.equivalent});

  @ignore
  @override
  List<Object?> get props => [name, equivalent];
}
