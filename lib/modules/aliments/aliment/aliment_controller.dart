import 'package:dropdown_search/dropdown_search.dart';
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
  final GlobalKey<FormBuilderState> newBrandFormKey = GlobalKey();
  final GlobalKey<FormBuilderState> newCategoryFormKey = GlobalKey();

  final GlobalKey<DropdownSearchState<String>> brandsDropdownKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> categoriesDropdownKey =
      GlobalKey();

  String? initialName;
  String? initialBarcode;
  List<String>? initialBrands = [];
  List<String>? initialCategories = [];
  String? initialNutriscore;
  String? initialUnit = DropdownValues.units[0];
  String? initialServingQuantity;
  String? initialCalories;
  String? initialProteins;
  String? initialCarbohydrates;
  String? initialSugars;
  String? initialLipids;
  String? initialSaturatedFats;

  final brands = Rx<List<String>>([]);
  final _selectedBrands = Rx<List<String>>([]);

  final categories = Rx<List<String>>([]);
  final _selectedCategories = Rx<List<String>>([]);

  @override
  Future<void> onInit() async {
    super.onInit();

    if (aliment != null) {
      initialName = aliment!.name;
      initialBarcode = aliment!.barcode;
      initialBrands = aliment!.brands;
      initialCategories = aliment!.categories;
      initialNutriscore = aliment!.nutriscore;
      initialUnit = aliment!.unit;
      initialServingQuantity = aliment!.servingQuantity.toString();
      initialCalories = aliment!.calories.toString();
      initialProteins = aliment!.proteins.toString();
      initialCarbohydrates = aliment!.carbohydrates.toString();
      initialSugars = aliment!.sugars.toString();
      initialLipids = aliment!.lipids.toString();
      initialSaturatedFats = aliment!.saturatedFats.toString();

      _selectedBrands.value = aliment!.brands ?? [];
      _selectedCategories.value = aliment!.categories ?? [];
    }

    brands.value = await _service.getAllBrandsDistinct();
    categories.value = await _service.getAllCategoriesDistinct();
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
        ..brands = formValues[FormKeys.brands]
        ..categories = formValues[FormKeys.categories]
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
        brands: formValues[FormKeys.brands],
        categories: formValues[FormKeys.categories],
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

  void clearNutriscore() =>
      formKey.currentState!.fields[FormKeys.nutriscore]!.didChange('');

  void updateBrands() {
    _selectedBrands.value = _selectedBrandsInPopup;
    formKey.currentState!.patchValue({FormKeys.brands: _selectedBrandsInPopup});
  }

  void updateCategories() {
    _selectedCategories.value = _selectedCategoriesInPopup;
    formKey.currentState!
        .patchValue({FormKeys.categories: _selectedCategoriesInPopup});
  }

  void addNewBrand() {
    if (newBrandFormKey.currentState!.saveAndValidate()) {
      final String newBrand =
          newBrandFormKey.currentState?.value[FormKeys.brands];

      if (!brands.value.contains(newBrand)) {
        brands.value.insert(0, newBrand);
        brandsDropdownKey.currentState!.getPopupState!.selectItems([newBrand]);

        goBack();
        goBack();
      }
    }
  }

  void addNewCategory() {
    if (newCategoryFormKey.currentState!.saveAndValidate()) {
      final String newCategory =
          newCategoryFormKey.currentState?.value[FormKeys.categories];

      if (!categories.value.contains(newCategory)) {
        categories.value.insert(0, newCategory);
        categoriesDropdownKey.currentState!.getPopupState!
            .selectItems([newCategory]);

        goBack();
        goBack();
      }
    }
  }

  void goBack() => Get.back();

  /// Returns sorted [_selectedBrands].
  List<String> get selectedBrands {
    List<String> brands = _selectedBrands.value;
    brands.sort();
    return brands;
  }

  /// Returns sorted [_selectedCategories].
  List<String> get selectedCategories {
    List<String> categories = _selectedCategories.value;
    categories.sort();
    return categories;
  }

  /// Returns currently selected items in the brands popup.
  List<String> get _selectedBrandsInPopup {
    return brandsDropdownKey.currentState!.getPopupState!.getSelectedItem;
  }

  /// Returns currently selected items in the categories popup.
  List<String> get _selectedCategoriesInPopup {
    return categoriesDropdownKey.currentState!.getPopupState!.getSelectedItem;
  }
}

abstract class FormKeys {
  static const String name = 'name';
  static const String barcode = 'barcode';
  static const String brands = 'brands';
  static const String categories = 'categories';
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
