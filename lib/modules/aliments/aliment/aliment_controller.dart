import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';
import '../aliments_controller.dart';

class AlimentController extends GetxController {
  final AlimentService _service = AlimentService();
  final AlimentsController cAliments = Get.find<AlimentsController>();

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

  void onValidateClick() {}

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

  // TODO vérifier qu'au moins une valeur est différente
  // TODO mettre à jour updateDate
  // TODO mettre à jour les macros des recettes si l'aliment a déjà été enregistré dans une recette
  Future<void> updateAliment(Aliment aliment) async {
    if (formKey.currentState!.validate()) {
      // aliment.value = double.parse(valueTEC.text);

      await _service.putAliment(aliment);
    }
  }

  void goBack() => Get.back();
}
