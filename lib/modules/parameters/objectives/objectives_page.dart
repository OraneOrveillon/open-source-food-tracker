import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
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
                    FormBuilderTextField(
                      name: FormKeys.calories,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.calories),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.proteins,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.proteins),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.carbohydrates,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.carbohydrates),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.sugars,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.sugars),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.lipids,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.lipids),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.saturatedFats,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.saturatedFats),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
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
