import 'package:flutter/material.dart';

class DoseInputs {
  DoseInputs({
    required this.id,
    required this.dropdownValue,
    required this.textFieldController,
  });

  final int id;
  String? dropdownValue;
  final TextEditingController textFieldController;

  @override
  String toString() {
    return 'DoseInputs('
        'id: $id, '
        'dropdownValue: $dropdownValue, '
        'textFieldController: ${textFieldController.text}'
        ')';
  }
}
