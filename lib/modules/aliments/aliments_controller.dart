import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_template/data/models/recipe_aliment_model.dart';
import 'package:get/get.dart';

import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';
import '../../core/mixins/scroll_pagination_mixin.dart';
import '../../core/utils/enums.dart';
import '../../core/utils/lists.dart';
import '../../routes/routes.dart';

class AlimentsController extends GetxController
    with ScrollPaginationMixin<Aliment> {
  AlimentsPageMode pageMode = Get.arguments;
  final AlimentService _service = AlimentService();

  final GlobalKey<FormBuilderState> recipeAlimentFormKey = GlobalKey();

  List<String> initialDosesList = [];

  final activeDose = Rx<String>('');

  @override
  Future<void> onInit() async {
    super.onInit();
    await initPagination(_getLastAliments);
  }

  Future<List<Aliment>> _getLastAliments(
    int numberOfAlimentsPerRequest,
    int alimentsOffset,
  ) async {
    return await _service.getLastAlimentsWithOffset(
      numberOfAlimentsPerRequest,
      alimentsOffset,
    );
  }

  void addAlimentInList(Aliment aliment) {
    addItemInList(aliment);
  }

  void updateAlimentInList(Aliment aliment) {
    updateItemInList(aliment, (element) => aliment.id == element.id);
  }

  // TODO vérifier si l'aliment a déjà été enregistré dans une recette
  Future<void> deleteAliment(Aliment aliment) async {
    await _service.deleteAliment(aliment);
    deleteItemInList((element) => aliment.id == element.id);
  }

  void onAddClick() => Get.toNamed(Routes.aliments + Routes.aliment);

  void onAlimentClick({
    required Aliment aliment,
    required Widget dialog,
  }) {
    if (pageMode == AlimentsPageMode.alimentsModule) {
      Get.toNamed(Routes.aliments + Routes.aliment, arguments: aliment);
    } else if (pageMode == AlimentsPageMode.recipeModule) {
      initialDosesList = [aliment.unit!, ...Lists.doses];
      activeDose.value = initialDosesList[0];
      Get.dialog(dialog);
    }
  }

  void updateActiveDose(String? value) => activeDose.value = value!;

  void onValidateRecipeAliment(Aliment aliment) {
    if (recipeAlimentFormKey.currentState!.saveAndValidate()) {
      final int quantity =
          recipeAlimentFormKey.currentState!.value[FormKeys.quantity];

      goBack();
      goBack(
        result: RecipeAliment()
          ..aliment.value = aliment
          ..dose = activeDose.value
          ..quantity = quantity,
      );
    }
  }

  void goBack({dynamic result}) => Get.back(result: result);

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }
}

abstract class FormKeys {
  static const String quantity = 'quantity';
}
