abstract class ValueTransformers {
  static Function(String?) intValue = (value) {
    if (value != null && value.isNotEmpty) {
      return int.parse(value);
    }
    return 0;
  };

  static Function(String?) doubleValue = (value) {
    if (value != null && value.isNotEmpty) {
      return double.parse(value);
    }
    return 0.0;
  };
}
