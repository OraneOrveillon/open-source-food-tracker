import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/texts.dart';
import '../../../../core/utils/validators.dart';
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
        return Form(
          key: cWeighings.formKey,
          child: TextFormField(
            controller: cWeighings.valueTEC,
            keyboardType: TextInputType.number,
            validator: (value) => Validators.notEmptyDouble(value),
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
