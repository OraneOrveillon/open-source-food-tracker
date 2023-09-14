import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/validators.dart';
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
              child: Form(
                key: cRecipe.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.name),
                      ),
                      controller: cRecipe.nameTEC,
                      keyboardType: TextInputType.text,
                      validator: (value) => Validators.required(value),
                    ),
                    // TODO tags
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.portions),
                      ),
                      controller: cRecipe.portionsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.description),
                      ),
                      controller: cRecipe.descriptionTEC,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      validator: (value) => null,
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
