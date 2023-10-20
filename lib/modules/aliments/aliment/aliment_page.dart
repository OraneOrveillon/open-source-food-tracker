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
import 'doses_controller.dart';
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
            controller: cAliment.scrollController,
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
              child: FormBuilder(
                key: cAliment.formKey,
                child: Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        DropdownSearchBrandsAndCategories(
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
                        DropdownSearchBrandsAndCategories(
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
                        CustomDropdown(
                          name: FormKeys.nutriscore,
                          label: InputLabelTexts.nutriscore,
                          initialValue: cAliment.initialNutriscore,
                          items: Lists.nutriscores,
                          validator: null,
                          clearFunction: () => cAliment.clearNutriscore(),
                        ),
                        // TODO image
                        CustomDropdown(
                          name: FormKeys.unit,
                          label: InputLabelTexts.unit,
                          initialValue: cAliment.initialUnit,
                          items: Lists.units,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          clearFunction: null,
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
                        ),
                        // TODO doses
                        const Padding(
                          padding: EdgeInsets.only(
                            top: Paddings.medium,
                          ),
                          child: Divider(),
                        ),
                        Text(
                          SectionTexts.doses,
                          style: Get.theme.textTheme.titleLarge,
                        ),
                        const DosesInputs(),
                        GetBuilder<DosesController>(
                          builder: (cDoses) {
                            return TextButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text('Add a dose...'),
                              onPressed: () => cDoses.addInputs(),
                            );
                          },
                        ),
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

class DosesInputs extends StatelessWidget {
  const DosesInputs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlimentController>(
      builder: (cAliment) {
        return GetBuilder<DosesController>(
          builder: (cDoses) {
            return FormBuilderField(
              // TODO pas de doublons dans les noms de doses
              // validator: ,
              name: FormKeys.doses,
              initialValue: cAliment.initialDoses,
              valueTransformer: ValueTransformers.doubleValueDoses,
              builder: (field) {
                return Column(
                  children: field.value!
                      .map(
                        (doseInputs) => Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField(
                                onChanged: (value) =>
                                    cDoses.onChangedDropdown(doseInputs, value),
                                value: doseInputs.dropdownValue,
                                items: Lists.doses
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        ))
                                    .toList(),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: InputHintTexts.equivalent,
                                  // TODO changer dynamiquement en fonction de l'unité sélectionnée
                                  suffixText: cAliment.initialUnit,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () =>
                                        cDoses.removeInputs(doseInputs),
                                  ),
                                ),
                                controller: doseInputs.textFieldController,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ]),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}
