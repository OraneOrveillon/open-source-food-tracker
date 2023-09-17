import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_template/data/services/objective_service.dart';
import 'package:get/get.dart';

import '../../../data/models/objective_model.dart';

class ObjectivesController extends GetxController {
  final ObjectiveService _service = ObjectiveService();

  Objective? lastObjective;

  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  @override
  Future<void> onInit() async {
    super.onInit();
    lastObjective = await _service.getLastObjective();

    if (lastObjective != null) {
      formKey.currentState!.patchValue({
        FormKeys.calories: lastObjective!.calories!.toString(),
        FormKeys.proteins: lastObjective!.proteins!.toString(),
        FormKeys.carbohydrates: lastObjective!.carbohydrates!.toString(),
        FormKeys.sugars: lastObjective!.sugars!.toString(),
        FormKeys.lipids: lastObjective!.lipids!.toString(),
        FormKeys.saturatedFats: lastObjective!.saturatedFats!.toString(),
      });
    }
  }

  void onValidateClick() async {
    if (formKey.currentState!.saveAndValidate()) {
      final formValues = formKey.currentState!.value;

      final Objective objective = Objective()
        ..creationDate = DateTime.now()
        ..calories = formValues[FormKeys.calories]
        ..proteins = formValues[FormKeys.proteins]
        ..carbohydrates = formValues[FormKeys.carbohydrates]
        ..sugars = formValues[FormKeys.sugars]
        ..lipids = formValues[FormKeys.lipids]
        ..saturatedFats = formValues[FormKeys.saturatedFats];

      await _service.putObjective(objective);

      Get.back();
    }
  }
}

abstract class FormKeys {
  static const String calories = 'calories';
  static const String proteins = 'proteins';
  static const String carbohydrates = 'carbohydrates';
  static const String sugars = 'sugars';
  static const String lipids = 'lipids';
  static const String saturatedFats = 'saturatedFats';
}
