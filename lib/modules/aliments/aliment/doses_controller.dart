import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import 'aliment_controller.dart';
import 'models/doses_inputs.dart';

class DosesController extends GetxController {
  final AlimentController _cAliment = Get.find<AlimentController>();

  Future<void> addInputs() async {
    final List<DoseInputs> dosesInputs = _dosesForm;

    dosesInputs.add(
      DoseInputs(
        id: _cAliment.inputsNextId,
        dropdownValue:
            _cAliment.inputsNextId == 0 ? DropdownValues.doses[0] : null,
        textFieldController: TextEditingController(),
      ),
    );
    _cAliment.inputsNextId++;

    _changeDosesFormValue(dosesInputs);

    await Future.delayed(const Duration(milliseconds: 50));
    _cAliment.scrollController.jumpTo(
      _cAliment.scrollController.position.maxScrollExtent,
    );
  }

  void removeInputs(DoseInputs doseInputs) {
    final List<DoseInputs> dosesInputs = _dosesForm;

    dosesInputs.removeWhere(((element) => element.id == doseInputs.id));

    _changeDosesFormValue(dosesInputs);
  }

  void onChangedDropdown(DoseInputs doseInputs, String? value) {
    final List<DoseInputs> dosesInputs = _dosesForm;

    dosesInputs
        .firstWhere((element) => element.id == doseInputs.id)
        .dropdownValue = value;

    _changeDosesFormValue(dosesInputs);
  }

  void _changeDosesFormValue(List<DoseInputs> dosesInputs) {
    _cAliment.formKey.currentState!.patchValue({FormKeys.doses: dosesInputs});
  }

  List<DoseInputs> get _dosesForm {
    _cAliment.formKey.currentState!.save();
    return _cAliment.formKey.currentState!.value[FormKeys.doses];
  }
}
