import 'package:flutter/material.dart';

/// A set of inputs associated with a [Dose].
class DoseInputs {
  DoseInputs({
    this.dropdownValue,
    required this.textFieldController,
  });

  /// The selected value in the dropdown associated with `name` property.
  String? dropdownValue;

  /// The controller of the [TextField] associated with `equivalent` property.
  final TextEditingController textFieldController;

  /// The transformed value of the [TextField].
  double? textFieldValue;
}
