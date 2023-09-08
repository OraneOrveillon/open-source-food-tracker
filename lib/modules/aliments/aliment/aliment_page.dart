import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/validators.dart';
import 'aliment_controller.dart';

class AlimentPage extends StatelessWidget {
  const AlimentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aliments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.medium),
        child: GetBuilder<AlimentController>(
          builder: (cAliment) {
            return Column(
              children: [
                Expanded(
                  child: Form(
                    key: cAliment.formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.name),
                          ),
                          controller: cAliment.nameTEC,
                          keyboardType: TextInputType.text,
                          validator: (value) => Validators.required(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.barcode),
                          ),
                          controller: cAliment.barcodeTEC,
                          keyboardType: TextInputType.number,
                          validator: null,
                        ),
                        // TODO brands
                        // TODO categories
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.nutriscore),
                          ),
                          items: DropdownValues.nutriscores
                              .map((String value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          value: cAliment.nutriscoreValue,
                          onChanged: (value) =>
                              cAliment.nutriscoreValue = value,
                          validator: null,
                        ),
                        // TODO image
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.unit),
                          ),
                          items: DropdownValues.units
                              .map((String value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          value: cAliment.unitValue,
                          onChanged: (value) => cAliment.unitValue = value,
                          validator: (value) => Validators.required(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.servingQuantity),
                          ),
                          controller: cAliment.servingQuantityTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.optionalDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.calories),
                          ),
                          controller: cAliment.caloriesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validators.requiredInt(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.proteins),
                          ),
                          controller: cAliment.proteinsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.carbohydrates),
                          ),
                          controller: cAliment.carbohydratesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.sugars),
                          ),
                          controller: cAliment.sugarsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.lipids),
                          ),
                          controller: cAliment.lipidsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.saturatedFats),
                          ),
                          controller: cAliment.saturatedFatsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        // TODO doses
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => cAliment.addAliment(),
                  child: const Text(ButtonTexts.validate),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}