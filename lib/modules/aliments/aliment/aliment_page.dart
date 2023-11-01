import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/errors.dart';
import '../../../core/utils/lists.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/value_transformers.dart';
import '../../../widgets/form/dropdown.dart';
import '../../../widgets/form/dropdown_search.dart';
import '../../../widgets/form/image_selector.dart';
import '../../../widgets/section_title.dart';
import '../../../widgets/form/text_field.dart';
import 'aliment_controller.dart';

class AlimentPage extends StatelessWidget {
  const AlimentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlimentController>(
      builder: (cAliment) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => cAliment.onValidateClick(),
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
              child: FormBuilder(
                key: cAliment.formKey,
                child: Obx(
                  () {
                    return Column(
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
                            ImageInput(
                              name: FormKeys.image,
                              initialValue: cAliment.initialImage,
                              pickImageCallback: (image) =>
                                  cAliment.updateImage(image),
                              clearImageFunction: () => cAliment.clearImage(),
                            ),
                          ],
                        ),
                        CustomTextField(
                          name: FormKeys.name,
                          label: InputLabelTexts.name,
                          initialValue: cAliment.initialName,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          valueTransformer: null,
                          keyboardType: TextInputType.text,
                        ),
                        CustomTextField(
                          name: FormKeys.barcode,
                          label: InputLabelTexts.barcode,
                          initialValue: cAliment.initialBarcode,
                          validator: null,
                          valueTransformer: null,
                          keyboardType: TextInputType.number,
                        ),
                        CustomDropdownSearch(
                          inputName: FormKeys.brands,
                          label: InputLabelTexts.brands,
                          initialValue: cAliment.initialBrands,
                          dropdownKey: cAliment.brandsDropdownKey,
                          items: cAliment.brands.value,
                          selectedItems: cAliment.selectedBrands,
                          updateFunction: () => cAliment.updateBrands(),
                          dialogTitle: DialogTexts.addBrand,
                          dialogFormKey: cAliment.newBrandFormKey,
                          dialogAlreadyExistsErrorText:
                              Errors.brandAlreadyExists,
                          onOKClick: () => cAliment.addNewBrand(),
                        ),
                        CustomDropdownSearch(
                          inputName: FormKeys.categories,
                          label: InputLabelTexts.categories,
                          initialValue: cAliment.initialCategories,
                          dropdownKey: cAliment.categoriesDropdownKey,
                          items: cAliment.categories.value,
                          selectedItems: cAliment.selectedCategories,
                          updateFunction: () => cAliment.updateCategories(),
                          dialogTitle: DialogTexts.addCategory,
                          dialogFormKey: cAliment.newCategoryFormKey,
                          dialogAlreadyExistsErrorText:
                              Errors.categoryAlreadyExists,
                          onOKClick: () => cAliment.addNewCategory(),
                        ),
                        const SectionTitle(title: SectionTexts.nutrition),
                        CustomDropdown(
                          name: FormKeys.nutriscore,
                          label: InputLabelTexts.nutriscore,
                          initialValue: cAliment.initialNutriscore,
                          items: Lists.nutriscores,
                          validator: null,
                          clearFunction: () => cAliment.clearNutriscore(),
                        ),
                        CustomDropdown(
                          name: FormKeys.unit,
                          label: InputLabelTexts.unit,
                          initialValue: cAliment.initialUnit,
                          items: Lists.units,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          clearFunction: null,
                          onChanged: (value) =>
                              cAliment.updateActiveUnit(value),
                        ),
                        CustomTextField(
                          name: FormKeys.servingQuantity,
                          label: InputLabelTexts.servingQuantity,
                          initialValue: cAliment.initialServingQuantity,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(),
                          ]),
                          valueTransformer: ValueTransformers.doubleValue,
                          keyboardType: TextInputType.number,
                          suffixText: cAliment.activeUnit.value,
                        ),
                        CustomTextField(
                          name: FormKeys.calories,
                          label: InputLabelTexts.calories,
                          initialValue: cAliment.initialCalories,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.integer(),
                          ]),
                          valueTransformer: ValueTransformers.intValue,
                          keyboardType: TextInputType.number,
                          suffixText: InputSuffixTexts.kcal100(
                            cAliment.activeUnit.value,
                          ),
                        ),
                        CustomTextField(
                          name: FormKeys.proteins,
                          label: InputLabelTexts.proteins,
                          initialValue: cAliment.initialProteins,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          valueTransformer: ValueTransformers.doubleValue,
                          keyboardType: TextInputType.number,
                          suffixText: InputSuffixTexts.g100(
                            cAliment.activeUnit.value,
                          ),
                        ),
                        CustomTextField(
                          name: FormKeys.carbohydrates,
                          label: InputLabelTexts.carbohydrates,
                          initialValue: cAliment.initialCarbohydrates,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          valueTransformer: ValueTransformers.doubleValue,
                          keyboardType: TextInputType.number,
                          suffixText: InputSuffixTexts.g100(
                            cAliment.activeUnit.value,
                          ),
                        ),
                        CustomTextField(
                          name: FormKeys.sugars,
                          label: InputLabelTexts.sugars,
                          initialValue: cAliment.initialSugars,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          valueTransformer: ValueTransformers.doubleValue,
                          keyboardType: TextInputType.number,
                          suffixText: InputSuffixTexts.g100(
                            cAliment.activeUnit.value,
                          ),
                        ),
                        CustomTextField(
                          name: FormKeys.lipids,
                          label: InputLabelTexts.lipids,
                          initialValue: cAliment.initialLipids,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          valueTransformer: ValueTransformers.doubleValue,
                          keyboardType: TextInputType.number,
                          suffixText: InputSuffixTexts.g100(
                            cAliment.activeUnit.value,
                          ),
                        ),
                        CustomTextField(
                          name: FormKeys.saturatedFats,
                          label: InputLabelTexts.saturatedFats,
                          initialValue: cAliment.initialSaturatedFats,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          valueTransformer: ValueTransformers.doubleValue,
                          keyboardType: TextInputType.number,
                          suffixText: InputSuffixTexts.g100(
                            cAliment.activeUnit.value,
                          ),
                        ),
                        const SectionTitle(title: SectionTexts.doses),
                        _DosesInputs(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DosesInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AlimentController>(
      builder: (cAliment) {
        return Row(children: [
          for (final dose in FormKeys.doses) ...[
            Flexible(
              child: CustomTextField(
                name: dose,
                label: dose,
                initialValue: cAliment.getInitialDoseValue(dose),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(),
                ]),
                valueTransformer: ValueTransformers.doubleValue,
                keyboardType: TextInputType.number,
                suffixText: cAliment.activeUnit.value,
              ),
            ),
            Builder(builder: (_) {
              if (dose != FormKeys.doses.last) {
                return const SizedBox(width: Paddings.medium);
              }
              return const SizedBox.shrink();
            }),
          ]
        ]);
      },
    );
  }
}
