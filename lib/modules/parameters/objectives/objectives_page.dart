import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/value_transformers.dart';
import '../../../widgets/text_field.dart';
import 'objectives_controller.dart';

class ObjectivesPage extends StatelessWidget {
  const ObjectivesPage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<ObjectivesController>(
      builder: (cObjectives) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppBarTexts.objectives),
            actions: [
              IconButton(
                onPressed: () => cObjectives.onValidateClick(),
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
              child: FormBuilder(
                key: cObjectives.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      name: FormKeys.calories,
                      label: InputLabelTexts.calories,
                      initialValue: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                      suffixText: InputSuffixTexts.kcalD,
                    ),
                    CustomTextField(
                      name: FormKeys.proteins,
                      label: InputLabelTexts.proteins,
                      initialValue: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                      suffixText: InputSuffixTexts.gD,
                    ),
                    CustomTextField(
                      name: FormKeys.carbohydrates,
                      label: InputLabelTexts.carbohydrates,
                      initialValue: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                      suffixText: InputSuffixTexts.gD,
                    ),
                    CustomTextField(
                      name: FormKeys.sugars,
                      label: InputLabelTexts.sugars,
                      initialValue: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                      suffixText: InputSuffixTexts.gD,
                    ),
                    CustomTextField(
                      name: FormKeys.lipids,
                      label: InputLabelTexts.lipids,
                      initialValue: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                      suffixText: InputSuffixTexts.gD,
                    ),
                    CustomTextField(
                      name: FormKeys.saturatedFats,
                      label: InputLabelTexts.saturatedFats,
                      initialValue: null,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                      suffixText: InputSuffixTexts.gD,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
