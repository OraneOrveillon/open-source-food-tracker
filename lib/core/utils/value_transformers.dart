import '../../modules/aliments/aliment/models/doses_inputs.dart';

abstract class ValueTransformers {
  static Function(String?) intValue = (value) {
    if (value != null) {
      return int.parse(value);
    }
  };

  static Function(String?) doubleValue = (value) {
    if (value != null) {
      return double.parse(value);
    }
  };

  // TODO retester avec retour d'une Dose
  static Function(List<DoseInputs>?) doubleValueDoses = (dosesInputs) {
    if (dosesInputs != null) {
      return dosesInputs
          .map((doseInputs) => doseInputs
            ..textFieldValue =
                double.tryParse(doseInputs.textFieldController.text))
          .toList();
    }
  };
}
