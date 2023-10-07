import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.name,
    required this.label,
    required this.initialValue,
    required this.items,
    required this.validator,
    required this.clearFunction,
  }) : super(key: key);

  final String name;
  final String label;
  final String? initialValue;
  final List<String> items;
  final String? Function(String?)? validator;
  final void Function()? clearFunction;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: name,
      initialValue: initialValue,
      decoration: InputDecoration(
        label: Text(label),
        suffixIcon: _buildClearIcon(),
      ),
      items: items
          .map((String value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      validator: null,
    );
  }

  Widget? _buildClearIcon() {
    if (clearFunction != null) {
      return IconButton(
        onPressed: clearFunction,
        icon: const Icon(Icons.clear),
      );
    }
    return null;
  }
}
