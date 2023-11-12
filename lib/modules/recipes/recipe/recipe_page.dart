import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/errors.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/validators.dart';
import '../../../core/utils/value_transformers.dart';
import '../../../data/models/recipe_aliment_model.dart';
import '../../../widgets/form/dropdown_search.dart';
import '../../../widgets/form/image_selector.dart';
import '../../../widgets/section_title.dart';
import '../../../widgets/form/text_field.dart';
import 'recipe_controller.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<RecipeController>(
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
          body: Padding(
            padding: const EdgeInsets.all(Paddings.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: cRecipe.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SectionTitle(
                                title: SectionTexts.general,
                                isFirstSection: true,
                              ),
                              ImageSelector(
                                name: FormKeys.image,
                                initialValue: cRecipe.initialImage,
                                pickImageCallback: (image) =>
                                    cRecipe.updateImage(image),
                                clearImageFunction: () => cRecipe.clearImage(),
                              ),
                            ],
                          ),
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
                          CustomDropdownSearch(
                            inputName: FormKeys.tags,
                            label: InputLabelTexts.tags,
                            initialValue: cRecipe.initialTags,
                            dropdownKey: cRecipe.tagsDropdownKey,
                            items: cRecipe.tags.value,
                            selectedItems: cRecipe.selectedTags,
                            updateFunction: () => cRecipe.updateTags(),
                            dialogTitle: DialogTexts.addTag,
                            dialogFormKey: cRecipe.newTagFormKey,
                            dialogAlreadyExistsErrorText:
                                Errors.tagAlreadyExists,
                            onOKClick: () => cRecipe.addNewTag(),
                          ),
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
                          const SectionTitle(title: SectionTexts.aliments),
                          // TODO wigdet à part
                          FormBuilderField<List<RecipeAliment>>(
                            name: FormKeys.aliments,
                            initialValue: cRecipe.initialRecipeAliments,
                            validator: Validators.recipeAlimentsValidator,
                            valueTransformer: null,
                            builder: (field) {
                              if (field.hasError) {
                                return TextFormField(
                                  decoration: InputDecoration(
                                    errorText: field.errorText,
                                  ),
                                  readOnly: true,
                                );
                              }
                              return Column(
                                children: field.value!.map((recipeAliment) {
                                  return ListTile(
                                    minLeadingWidth: 56,
                                    title: Text(
                                      recipeAliment.aliment.value!.name
                                          .toString(),
                                    ),
                                    subtitle: Text(
                                      '${recipeAliment.quantity}${recipeAliment.dose}',
                                    ),
                                    leading: _buildListTileImage(recipeAliment),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () => cRecipe
                                          .onRemoveAlimentClick(recipeAliment),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add aliment'),
                  onPressed: () => cRecipe.onAddAlimentClick(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListTileImage(RecipeAliment recipeAliment) {
    final image = recipeAliment.aliment.value?.image;

    if (image != null) {
      return Image(
        image: MemoryImage(Uint8List.fromList(image)),
      );
    }
    return const SizedBox.square();
  }
}
