import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/utils/texts.dart';

class DialogSingleInputForm extends StatelessWidget {
  const DialogSingleInputForm({
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: FormBuilder(
        key: formKey,
        child: FormBuilderTextField(
          name: inputName,
          initialValue: initialValue,
          validator: validator,
          valueTransformer: valueTransformer,
          keyboardType: keyboardType,
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
