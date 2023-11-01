import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/utils/texts.dart';
import 'text_field.dart';

class DialogSingleInput extends StatelessWidget {
  const DialogSingleInput({
    super.key,
    required this.title,
    required this.formKey,
    required this.inputName,
    required this.initialValue,
    required this.validator,
    required this.valueTransformer,
    required this.keyboardType,
    required this.onCancelClick,
    required this.onOKClick,
    this.suffixText,
  });

  final String title;
  final GlobalKey<FormBuilderState> formKey;
  final String inputName;
  final String? initialValue;
  final String? Function(String?)? validator;
  final dynamic Function(String?)? valueTransformer;
  final TextInputType? keyboardType;
  final void Function() onCancelClick;
  final void Function() onOKClick;
  final String? suffixText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: FormBuilder(
        key: formKey,
        child: CustomTextField(
          name: inputName,
          label: null,
          initialValue: initialValue,
          validator: validator,
          valueTransformer: valueTransformer,
          keyboardType: keyboardType,
          suffixText: suffixText,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onCancelClick,
          child: const Text(ButtonTexts.cancel),
        ),
        TextButton(
          onPressed: onOKClick,
          child: const Text(ButtonTexts.ok),
        ),
      ],
    );
  }
}
