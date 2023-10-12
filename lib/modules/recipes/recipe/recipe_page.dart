import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/value_transformers.dart';
import '../../../widgets/text_field.dart';
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
                    CustomTextField(
                      name: FormKeys.name,
                      label: InputLabelTexts.name,
                      initialValue: cRecipe.initialName,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      valueTransformer: null,
                      keyboardType: TextInputType.text,
                    ),
                    // TODO tags
                    CustomTextField(
                      name: FormKeys.portions,
                      label: InputLabelTexts.portions,
                      initialValue: cRecipe.initialPortions,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                      ]),
                      valueTransformer: ValueTransformers.intValue,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      name: FormKeys.description,
                      label: InputLabelTexts.description,
                      initialValue: cRecipe.initialDescription,
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
