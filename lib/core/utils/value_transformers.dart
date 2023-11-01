import 'dart:typed_data';

abstract class ValueTransformers {
  static int Function(String?) intValue = (value) {
    if (value != null && value.isNotEmpty) {
      return int.parse(value);
    }
    return 0;
  };

  static double Function(String?) doubleValue = (value) {
    if (value != null && value.isNotEmpty) {
      return double.parse(value);
    }
    return 0.0;
  };

  static List<int>? Function(Uint8List?) imageValue = (value) {
    return value?.toList();
  };
}
