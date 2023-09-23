import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../core/utils/texts.dart';
import '../weighings_controller.dart';

class DialogWeighingForm extends StatelessWidget {
  const DialogWeighingForm({
    super.key,
    required this.title,
    required this.onCancelClick,
    required this.onOKClick,
  });

  final String title;
  final void Function() onCancelClick;
  final void Function() onOKClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: GetBuilder<WeighingsController>(builder: (cWeighings) {
        return FormBuilder(
          key: cWeighings.formKey,
          child: FormBuilderTextField(
            name: FormKeys.value,
            initialValue: cWeighings.initialValue,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            valueTransformer: (value) => double.parse(value!),
            keyboardType: TextInputType.number,
          ),
        );
      }),
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
