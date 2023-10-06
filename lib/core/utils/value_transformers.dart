abstract class ValueTransformers {
  static Function(String?)? intValue = (value) {
    if (value != null) {
      return int.parse(value);
    }
  };

  static Function(String?)? doubleValue = (value) {
    if (value != null) {
      return double.parse(value);
    }
  };
}
