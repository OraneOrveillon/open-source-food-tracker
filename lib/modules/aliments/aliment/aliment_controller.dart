import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';

class AlimentController extends GetxController {
  final AlimentService _service = AlimentService();

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

  // TODO vérifier l'utilité du Rx à la validation (+ GetX ou GetBuilder)
  final nutriscoreValue = Rx<String?>(null);
  final unitValue = Rx<String?>(DropdownValues.units[0]);

  void onValidateClick() {}

  Future<void> addAliment() async {
    if (formKey.currentState!.validate()) {
      final Aliment aliment = Aliment();
      // ..date = DateTime.now()
      // ..value = double.parse(valueTEC.text);

      await _service.putAliment(aliment);
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
}
