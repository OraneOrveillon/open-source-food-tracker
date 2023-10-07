import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.name,
    required this.label,
    required this.initialValue,
    required this.validator,
    required this.valueTransformer,
    required this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  final String name;
  final String? label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final dynamic Function(String?)? valueTransformer;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      decoration: _buildInputDecoration(),
      validator: validator,
      valueTransformer: valueTransformer,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }

  InputDecoration _buildInputDecoration() {
    if (label != null) {
      return InputDecoration(
        label: Text(label!),
      );
    }
    return const InputDecoration();
  }
}
