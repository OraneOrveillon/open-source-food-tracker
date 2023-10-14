import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import 'aliment_controller.dart';

class DosesController extends GetxController {
  final AlimentController _cAliment = Get.find<AlimentController>();

  int _inputsNextId = 0;

  final dosesInputs = Rx<List<DoseInputs>>([]);

  Future<void> addInputs() async {
    dosesInputs.value.add(DoseInputs(
        id: _inputsNextId,
        dropdownValue: _inputsNextId == 0 ? DropdownValues.doses[0] : null,
        textFieldController: TextEditingController()));
    dosesInputs.refresh();
    _inputsNextId++;

    await Future.delayed(const Duration(milliseconds: 50));
    _cAliment.scrollController.jumpTo(
      _cAliment.scrollController.position.maxScrollExtent,
    );
  }

  void removeInputs(DoseInputs doseInputs) {
    dosesInputs.value.removeWhere(((element) => element.id == doseInputs.id));
    dosesInputs.refresh();
  }

  void onChangedDropdown(DoseInputs doseInputs, String? value) {
    dosesInputs.value
        .firstWhere((element) => element.id == doseInputs.id)
        .dropdownValue = value;
  }
}

class DoseInputs {
  DoseInputs({
    required this.id,
    required this.dropdownValue,
    required this.textFieldController,
  });

  final int id;
  String? dropdownValue;
  final TextEditingController textFieldController;
}
