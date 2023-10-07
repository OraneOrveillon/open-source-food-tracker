import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/errors.dart';
import '../../../core/utils/lists.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/value_transformers.dart';
import '../../../widgets/text_field.dart';
import 'aliment_controller.dart';
import 'widgets/dropdown_search_brands_categories.dart';

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
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        name: FormKeys.name,
                        initialValue: cAliment.initialName,
                        label: InputTexts.name,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        valueTransformer: null,
                        keyboardType: TextInputType.text,
                      ),
                      CustomTextField(
                        name: FormKeys.barcode,
                        initialValue: cAliment.initialBarcode,
                        label: InputTexts.barcode,
                        validator: null,
                        valueTransformer: null,
                        keyboardType: TextInputType.number,
                      ),
                      DropdownSearchBrandsAndCategories(
                        inputName: FormKeys.brands,
                        initialValue: cAliment.initialBrands,
                        dropdownKey: cAliment.brandsDropdownKey,
                        label: InputTexts.brands,
                        items: cAliment.brands.value,
                        selectedItems: cAliment.selectedBrands,
                        updateFunction: () => cAliment.updateBrands(),
                        dialogTitle: DialogTexts.addBrand,
                        dialogFormKey: cAliment.newBrandFormKey,
                        dialogAlreadyExistsErrorText: Errors.brandAlreadyExists,
                        onOKClick: () => cAliment.addNewBrand(),
                      ),
                      DropdownSearchBrandsAndCategories(
                        inputName: FormKeys.categories,
                        initialValue: cAliment.initialCategories,
                        dropdownKey: cAliment.categoriesDropdownKey,
                        label: InputTexts.categories,
                        items: cAliment.categories.value,
                        selectedItems: cAliment.selectedCategories,
                        updateFunction: () => cAliment.updateCategories(),
                        dialogTitle: DialogTexts.addCategory,
                        dialogFormKey: cAliment.newCategoryFormKey,
                        dialogAlreadyExistsErrorText:
                            Errors.categoryAlreadyExists,
                        onOKClick: () => cAliment.addNewCategory(),
                      ),
                      FormBuilderDropdown(
                        name: FormKeys.nutriscore,
                        initialValue: cAliment.initialNutriscore,
                        decoration: InputDecoration(
                          label: const Text(InputTexts.nutriscore),
                          suffixIcon: IconButton(
                            onPressed: () => cAliment.clearNutriscore(),
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        items: DropdownValues.nutriscores
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        validator: null,
                      ),
                      // TODO image
                      FormBuilderDropdown(
                        name: FormKeys.unit,
                        initialValue: cAliment.initialUnit,
                        decoration: const InputDecoration(
                          label: Text(InputTexts.unit),
                        ),
                        items: DropdownValues.units
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      CustomTextField(
                        name: FormKeys.servingQuantity,
                        initialValue: cAliment.initialServingQuantity,
                        label: InputTexts.servingQuantity,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.calories,
                        initialValue: cAliment.initialCalories,
                        label: InputTexts.calories,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.integer(),
                        ]),
                        valueTransformer: ValueTransformers.intValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.proteins,
                        initialValue: cAliment.initialProteins,
                        label: InputTexts.proteins,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.carbohydrates,
                        initialValue: cAliment.initialCarbohydrates,
                        label: InputTexts.carbohydrates,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.sugars,
                        initialValue: cAliment.initialSugars,
                        label: InputTexts.sugars,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.lipids,
                        initialValue: cAliment.initialLipids,
                        label: InputTexts.lipids,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.saturatedFats,
                        initialValue: cAliment.initialSaturatedFats,
                        label: InputTexts.saturatedFats,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      // TODO doses
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
