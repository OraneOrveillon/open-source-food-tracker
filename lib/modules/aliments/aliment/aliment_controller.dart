import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';
import '../aliments_controller.dart';

class AlimentController extends GetxController {
  final AlimentService _service = AlimentService();
  final AlimentsController cAliments = Get.find<AlimentsController>();
  Aliment? aliment = Get.arguments;

  final GlobalKey<FormState> formKey = GlobalKey();

  final nameTEC = TextEditingController();
  final barcodeTEC = TextEditingController();
  final servingQuantityTEC = TextEditingController();
  final caloriesTEC = TextEditingController();
  final proteinsTEC = TextEditingController();
  final carbohydratesTEC = TextEditingController();
  final sugarsTEC = TextEditingController();
  final lipidsTEC = TextEditingController();
  final saturatedFatsTEC = TextEditingController();

  String? nutriscoreValue;
  String? unitValue = DropdownValues.units[0];

  @override
  void onInit() {
    super.onInit();
    if (aliment != null) {
      nameTEC.text = aliment!.name!;
      barcodeTEC.text = aliment!.barcode!;
      servingQuantityTEC.text = aliment!.servingQuantity!.toString();
      caloriesTEC.text = aliment!.calories!.toString();
      proteinsTEC.text = aliment!.proteins!.toString();
      carbohydratesTEC.text = aliment!.carbohydrates.toString();
      sugarsTEC.text = aliment!.sugars!.toString();
      lipidsTEC.text = aliment!.lipids!.toString();
      saturatedFatsTEC.text = aliment!.saturatedFats!.toString();

      nutriscoreValue = aliment!.nutriscore;
      unitValue = aliment!.unit;
    }
  }

  void onValidateClick() => aliment == null ? addAliment() : updateAliment();

  Future<void> addAliment() async {
    if (formKey.currentState!.validate()) {
      final Aliment aliment = Aliment()
        ..creationDate = DateTime.now()
        ..name = nameTEC.text
        ..barcode = barcodeTEC.text
        ..nutriscore = nutriscoreValue
        ..unit = unitValue
        ..servingQuantity = double.parse(servingQuantityTEC.text)
        ..calories = int.parse(caloriesTEC.text)
        ..proteins = double.parse(proteinsTEC.text)
        ..carbohydrates = double.parse(carbohydratesTEC.text)
        ..sugars = double.parse(sugarsTEC.text)
        ..lipids = double.parse(lipidsTEC.text)
        ..saturatedFats = double.parse(saturatedFatsTEC.text)
        ..deleted = false;
      await _service.putAliment(aliment);

      cAliments.addAlimentInList(aliment);

      goBack();
    }
  }

  // TODO mettre à jour les macros des recettes si l'aliment a déjà été enregistré dans une recette
  Future<void> updateAliment() async {
    if (formKey.currentState!.validate()) {
      final Aliment newAliment = aliment!.copyWith(
        name: nameTEC.text,
        barcode: barcodeTEC.text,
        nutriscore: nutriscoreValue,
        unit: unitValue,
        servingQuantity: double.parse(servingQuantityTEC.text),
        calories: int.parse(caloriesTEC.text),
        proteins: double.parse(proteinsTEC.text),
        carbohydrates: double.parse(carbohydratesTEC.text),
        sugars: double.parse(sugarsTEC.text),
        lipids: double.parse(lipidsTEC.text),
        saturatedFats: double.parse(saturatedFatsTEC.text),
      );

      if (newAliment != aliment) {
        await _service.putAliment(newAliment..updateDate = DateTime.now());
      }

      cAliments.updateAlimentInList(newAliment);

      goBack();
    }
  }

  void goBack() => Get.back();
}
