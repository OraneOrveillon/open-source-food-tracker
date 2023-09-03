import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          builder: (cAliments) {
            return Column(
              children: [
                Expanded(
                  child: Form(
                    key: cAliments.formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.name),
                          ),
                          controller: cAliments.nameTEC,
                          keyboardType: TextInputType.text,
                          validator: (value) => Validators.required(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.barcode),
                          ),
                          controller: cAliments.barcodeTEC,
                          keyboardType: TextInputType.number,
                          validator: null,
                        ),
                        // TODO brands
                        // TODO categories
                        // TODO nutriscore
                        // TODO image
                        // TODO unit
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.servingQuantity),
                          ),
                          controller: cAliments.servingQuantityTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.optionalDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.calories),
                          ),
                          controller: cAliments.caloriesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validators.requiredInt(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.proteins),
                          ),
                          controller: cAliments.proteinsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.carbohydrates),
                          ),
                          controller: cAliments.carbohydratesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.sugars),
                          ),
                          controller: cAliments.sugarsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.lipids),
                          ),
                          controller: cAliments.lipidsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(InputTexts.saturatedFats),
                          ),
                          controller: cAliments.saturatedFatsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => cAliments.onValidateClick(),
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
