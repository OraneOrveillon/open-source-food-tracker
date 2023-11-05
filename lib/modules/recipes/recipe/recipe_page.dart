import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/errors.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/value_transformers.dart';
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
          body: SingleChildScrollView(
            // TODO image
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
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
                      dialogAlreadyExistsErrorText: Errors.tagAlreadyExists,
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
                    for (final aliment in cRecipe.aliments.value)
                      ListTile(
                        title: Text(aliment.name.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () =>
                              cRecipe.onRemoveAlimentClick(aliment),
                        ),
                      )
                    // TODO ListTile pour chaque aliment, le tout enrobé d'un FormBuilderField (afficher un texte en rouge s'il n'y a aucun aliment ajouté)
                    // TODO afficher l'image des aliments qui en ont une
                  ],
                ),
              ),
            ),
          ),
          // TODO remplacer par un bouton normal
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Add aliment'),
            icon: const Icon(Icons.add),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () => cRecipe.onAddAlimentClick(),
          ),
        );
      },
    );
  }
}
