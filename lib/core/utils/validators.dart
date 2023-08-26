import 'errors.dart';

abstract class Validators {
  static String? notEmptyInt(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return ValidatorErrors.notEmptyInt;
    }
    return null;
  }

  static String? notEmptyDouble(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return ValidatorErrors.notEmptyDouble;
    }
    return null;
  }
}
