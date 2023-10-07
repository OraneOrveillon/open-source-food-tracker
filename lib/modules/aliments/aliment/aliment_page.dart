import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/errors.dart';
import '../../../core/utils/lists.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/value_transformers.dart';
import '../../../widgets/dropdown.dart';
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
                        label: InputTexts.name,
                        initialValue: cAliment.initialName,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        valueTransformer: null,
                        keyboardType: TextInputType.text,
                      ),
                      CustomTextField(
                        name: FormKeys.barcode,
                        label: InputTexts.barcode,
                        initialValue: cAliment.initialBarcode,
                        validator: null,
                        valueTransformer: null,
                        keyboardType: TextInputType.number,
                      ),
                      DropdownSearchBrandsAndCategories(
                        inputName: FormKeys.brands,
                        label: InputTexts.brands,
                        initialValue: cAliment.initialBrands,
                        dropdownKey: cAliment.brandsDropdownKey,
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
                        label: InputTexts.categories,
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
                      CustomDropdown(
                        name: FormKeys.nutriscore,
                        label: InputTexts.nutriscore,
                        initialValue: cAliment.initialNutriscore,
                        items: DropdownValues.nutriscores,
                        validator: null,
                        clearFunction: () => cAliment.clearNutriscore(),
                      ),
                      // TODO image
                      CustomDropdown(
                        name: FormKeys.unit,
                        label: InputTexts.unit,
                        initialValue: cAliment.initialUnit,
                        items: DropdownValues.units,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        clearFunction: null,
                      ),
                      CustomTextField(
                        name: FormKeys.servingQuantity,
                        label: InputTexts.servingQuantity,
                        initialValue: cAliment.initialServingQuantity,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.calories,
                        label: InputTexts.calories,
                        initialValue: cAliment.initialCalories,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.integer(),
                        ]),
                        valueTransformer: ValueTransformers.intValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.proteins,
                        label: InputTexts.proteins,
                        initialValue: cAliment.initialProteins,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.carbohydrates,
                        label: InputTexts.carbohydrates,
                        initialValue: cAliment.initialCarbohydrates,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.sugars,
                        label: InputTexts.sugars,
                        initialValue: cAliment.initialSugars,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.lipids,
                        label: InputTexts.lipids,
                        initialValue: cAliment.initialLipids,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        valueTransformer: ValueTransformers.doubleValue,
                        keyboardType: TextInputType.number,
                      ),
                      CustomTextField(
                        name: FormKeys.saturatedFats,
                        label: InputTexts.saturatedFats,
                        initialValue: cAliment.initialSaturatedFats,
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
