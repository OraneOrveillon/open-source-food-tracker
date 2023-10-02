import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../widgets/dialog_single_input_form.dart';
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
    return GetBuilder<WeighingsController>(
      builder: (cWeighings) {
        return DialogSingleInputForm(
          title: title,
          formKey: cWeighings.formKey,
          inputName: FormKeys.value,
          initialValue: cWeighings.initialValue,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.numeric(),
          ]),
          valueTransformer: (value) => double.parse(value!),
          keyboardType: TextInputType.number,
          onCancelClick: onCancelClick,
          onOKClick: onOKClick,
        );
      },
    );
  }
}
