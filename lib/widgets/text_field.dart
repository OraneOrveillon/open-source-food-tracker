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
    this.hintText,
    this.maxLines,
    this.suffixText,
    this.suffixIcon,
  }) : super(key: key);

  final String name;
  final String? label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final dynamic Function(String?)? valueTransformer;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final String? suffixText;
  final Widget? suffixIcon;

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
    Widget? labelWidget;
    if (label != null) {
      labelWidget = Text(label!);
    }

    return InputDecoration(
      label: labelWidget,
      suffixText: suffixText,
      suffixIcon: suffixIcon,
      hintText: hintText,
    );
  }
}
