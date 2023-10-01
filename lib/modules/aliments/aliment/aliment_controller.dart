import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';
import '../../../routes/routes.dart';
import '../aliments_controller.dart';

class AlimentController extends GetxController {
  final AlimentService _service = AlimentService();
  final AlimentsController _cAliments = Get.find<AlimentsController>();
  Aliment? aliment = Get.arguments;

  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  final GlobalKey<FormBuilderState> brandsFormKey = GlobalKey();

  String? initialName;
  String? initialBarcode;
  String? initialNutriscore;
  String? initialUnit = DropdownValues.units[0];
  String? initialServingQuantity;
  String? initialCalories;
  String? initialProteins;
  String? initialCarbohydrates;
  String? initialSugars;
  String? initialLipids;
  String? initialSaturatedFats;

  List<String> brands = [];
  final _selectedBrands = Rx<List<String>?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    if (aliment != null) {
      initialName = aliment!.name;
      initialBarcode = aliment!.barcode;
      initialNutriscore = aliment!.nutriscore;
      initialUnit = aliment!.unit;
      initialServingQuantity = aliment!.servingQuantity.toString();
      initialCalories = aliment!.calories.toString();
      initialProteins = aliment!.proteins.toString();
      initialCarbohydrates = aliment!.carbohydrates.toString();
      initialSugars = aliment!.sugars.toString();
      initialLipids = aliment!.lipids.toString();
      initialSaturatedFats = aliment!.saturatedFats.toString();

      _selectedBrands.value = aliment!.brands;
    }

    brands = await _service.getAllBrandsDistinct();
  }

  void goToBrands() =>
      Get.toNamed(Routes.aliments + Routes.aliment + Routes.brands);

  void onValidateClick() => aliment == null ? addAliment() : updateAliment();

  Future<void> addAliment() async {
    if (formKey.currentState!.saveAndValidate()) {
      final formValues = formKey.currentState!.value;

      final Aliment aliment = Aliment()
        ..creationDate = DateTime.now()
        ..name = formValues[FormKeys.name]
        ..barcode = formValues[FormKeys.barcode]
        ..brands = _selectedBrands.value
        ..nutriscore = formValues[FormKeys.nutriscore]
        ..unit = formValues[FormKeys.unit]
        ..servingQuantity = formValues[FormKeys.servingQuantity]
        ..calories = formValues[FormKeys.calories]
        ..proteins = formValues[FormKeys.proteins]
        ..carbohydrates = formValues[FormKeys.carbohydrates]
        ..sugars = formValues[FormKeys.sugars]
        ..lipids = formValues[FormKeys.lipids]
        ..saturatedFats = formValues[FormKeys.saturatedFats]
        ..deleted = false;

      await _service.putAliment(aliment);

      _cAliments.addAlimentInList(aliment);

      goBack();
    }
  }

  // TODO mettre à jour les macros des recettes si l'aliment a déjà été enregistré dans une recette
  Future<void> updateAliment() async {
    if (formKey.currentState!.saveAndValidate()) {
      final formValues = formKey.currentState!.value;

      final Aliment newAliment = aliment!.copyWith(
        name: formValues[FormKeys.name],
        barcode: formValues[FormKeys.barcode],
        brands: _selectedBrands.value,
        categories: null,
        nutriscore: formValues[FormKeys.nutriscore],
        image: null,
        unit: formValues[FormKeys.unit],
        servingQuantity: formValues[FormKeys.servingQuantity],
        calories: formValues[FormKeys.calories],
        proteins: formValues[FormKeys.proteins],
        carbohydrates: formValues[FormKeys.carbohydrates],
        sugars: formValues[FormKeys.sugars],
        lipids: formValues[FormKeys.lipids],
        saturatedFats: formValues[FormKeys.saturatedFats],
        doses: null,
      );

      if (newAliment != aliment) {
        await _service.putAliment(newAliment..updateDate = DateTime.now());
      }

      _cAliments.updateAlimentInList(newAliment);

      goBack();
    }
  }

  void updateBrands() {
    if (brandsFormKey.currentState!.saveAndValidate()) {
      final List<String>? newBrands =
          brandsFormKey.currentState!.value[FormKeys.brands];

      if (newBrands != _selectedBrands.value) {
        if (newBrands == null || newBrands.isEmpty) {
          _selectedBrands.value = null;
        } else {
          _selectedBrands.value = newBrands;
        }
      }

      Get.back();
    }
  }

  void clearNutriment() =>
      formKey.currentState!.fields[FormKeys.nutriscore]!.didChange('');

  void goBack() => Get.back();

  List<String>? get selectedBrands {
    if (_selectedBrands.value != null) {
      List<String> brands = _selectedBrands.value!;
      brands.sort();
      return brands;
    }
    return null;
  }
}

abstract class FormKeys {
  static const String name = 'name';
  static const String barcode = 'barcode';
  static const String brands = 'brands';
  static const String nutriscore = 'nutriscore';
  static const String unit = 'unit';
  static const String servingQuantity = 'servingQuantity';
  static const String calories = 'calories';
  static const String proteins = 'proteins';
  static const String carbohydrates = 'carbohydrates';
  static const String sugars = 'sugars';
  static const String lipids = 'lipids';
  static const String saturatedFats = 'saturatedFats';
}
