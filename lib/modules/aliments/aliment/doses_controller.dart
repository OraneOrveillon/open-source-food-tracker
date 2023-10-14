import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aliment_controller.dart';

class DosesController extends GetxController {
  final AlimentController _cAliment = Get.find<AlimentController>();

  int _inputsNextId = 0;

  final inputs = Rx<List<Inputs>>([]);

  void addInputs() {
    // TODO if le dernier input a bien été rempli
    // TODO scroller tout en bas
    inputs.value.add(Inputs(
        id: _inputsNextId,
        dropdownValue: null,
        textFieldController: TextEditingController()));
    inputs.refresh();
    _inputsNextId++;
  }

  void removeInputs(Inputs inputs) {
    this.inputs.value.removeWhere(((i) => i.id == inputs.id));
    this.inputs.refresh();
  }
}

class Inputs {
  Inputs({
    required this.id,
    required this.dropdownValue,
    required this.textFieldController,
  });

  final int id;
  String? dropdownValue;
  final TextEditingController textFieldController;
}
