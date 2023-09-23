import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import 'recipe_controller.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
      builder: (cRecipe) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => cRecipe.onValidateClick(),
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
              child: FormBuilder(
                key: cRecipe.formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: FormKeys.name,
                      initialValue: cRecipe.initialName,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.name),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      valueTransformer: null,
                      keyboardType: TextInputType.text,
                    ),
                    // TODO tags
                    FormBuilderTextField(
                      name: FormKeys.portions,
                      initialValue: cRecipe.initialPortions,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.portions),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: (value) => int.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.description,
                      initialValue: cRecipe.initialDescription,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.description),
                      ),
                      validator: null,
                      valueTransformer: null,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                    // TODO aliments
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
