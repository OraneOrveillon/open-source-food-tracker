import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import 'aliment_controller.dart';
import 'models/doses_inputs.dart';

class DosesController extends GetxController {
  final AlimentController _cAliment = Get.find<AlimentController>();

  int _inputsNextId = 0;

  Future<void> addInputs() async {
    _cAliment.dosesInputs.value.add(
      DoseInputs(
        id: _inputsNextId,
        dropdownValue: _inputsNextId == 0 ? DropdownValues.doses[0] : null,
        textFieldController: TextEditingController(),
      ),
    );
    _cAliment.dosesInputs.refresh();
    _inputsNextId++;

    await Future.delayed(const Duration(milliseconds: 50));
    _cAliment.scrollController.jumpTo(
      _cAliment.scrollController.position.maxScrollExtent,
    );
  }

  void removeInputs(DoseInputs doseInputs) {
    _cAliment.dosesInputs.value
        .removeWhere(((element) => element.id == doseInputs.id));
    _cAliment.dosesInputs.refresh();
  }

  void onChangedDropdown(DoseInputs doseInputs, String? value) {
    _cAliment.dosesInputs.value
        .firstWhere((element) => element.id == doseInputs.id)
        .dropdownValue = value;

    _cAliment.formKey.currentState!
        .patchValue({FormKeys.doses: _cAliment.dosesInputs.value});
  }
}
