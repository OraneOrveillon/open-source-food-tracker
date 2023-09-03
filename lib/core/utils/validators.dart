import 'errors.dart';

abstract class Validators {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrors.notEmpty;
    }
    return null;
  }

  static String? requiredInt(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return ValidatorErrors.int;
    }
    return null;
  }

  static String? requiredDouble(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return ValidatorErrors.double;
    }
    return null;
  }

  static String? optionalDouble(String? value) {
    if (value != null && double.tryParse(value) == null) {
      return ValidatorErrors.double;
    }
    return null;
  }
}
