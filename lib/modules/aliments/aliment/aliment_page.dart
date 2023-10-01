import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuilderTextField(
                      name: FormKeys.name,
                      initialValue: cAliment.initialName,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.name),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      valueTransformer: null,
                      keyboardType: TextInputType.text,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.barcode,
                      initialValue: cAliment.initialBarcode,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.barcode),
                      ),
                      validator: null,
                      valueTransformer: null,
                      keyboardType: TextInputType.number,
                    ),
                    Obx(
                      () {
                        String brandsString = ContentTexts.noBrands;
                        if (cAliment.selectedBrands.value != null) {
                          brandsString =
                              cAliment.selectedBrands.value!.join(', ');
                        }

                        return ListTile(
                          title: const Text(InputTexts.brands),
                          subtitle: Text(brandsString),
                          trailing: const Icon(
                            Icons.chevron_right,
                          ),
                          onTap: () => cAliment.goToBrands(),
                        );
                      },
                    ),
                    // TODO categories
                    // TODO rajouter clear button
                    FormBuilderDropdown(
                      name: FormKeys.nutriscore,
                      initialValue: cAliment.initialNutriscore,
                      decoration: InputDecoration(
                        label: const Text(InputTexts.nutriscore),
                        suffixIcon: IconButton(
                          onPressed: () => cAliment.clearNutriment(),
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
                    FormBuilderTextField(
                      name: FormKeys.servingQuantity,
                      initialValue: cAliment.initialServingQuantity,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.servingQuantity),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.numeric(),
                      ]),
                      valueTransformer: (value) {
                        if (value != null) {
                          return double.parse(value);
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.calories,
                      initialValue: cAliment.initialCalories,
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
                      initialValue: cAliment.initialProteins,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.proteins),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      valueTransformer: (value) => double.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.carbohydrates,
                      initialValue: cAliment.initialCarbohydrates,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.carbohydrates),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      valueTransformer: (value) => double.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.sugars,
                      initialValue: cAliment.initialSugars,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.sugars),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      valueTransformer: (value) => double.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.lipids,
                      initialValue: cAliment.initialLipids,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.lipids),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      valueTransformer: (value) => double.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: FormKeys.saturatedFats,
                      initialValue: cAliment.initialSaturatedFats,
                      decoration: const InputDecoration(
                        label: Text(InputTexts.saturatedFats),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      valueTransformer: (value) => double.parse(value!),
                      keyboardType: TextInputType.number,
                    ),
                    // TODO doses
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
