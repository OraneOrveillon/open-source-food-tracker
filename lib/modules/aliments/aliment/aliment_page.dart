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
                            // TODO constante (pareil pour ObjectivesPages)
                            label: Text('Name'),
                          ),
                          controller: cAliments.nameTEC,
                          keyboardType: TextInputType.text,
                          validator: (value) => Validators.required(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Barcode'),
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
                            label: Text('Serving quantity'),
                          ),
                          controller: cAliments.servingQuantityTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.optionalDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Calories'),
                          ),
                          controller: cAliments.caloriesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validators.requiredInt(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Proteins'),
                          ),
                          controller: cAliments.proteinsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Carbohydrates'),
                          ),
                          controller: cAliments.carbohydratesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Sugars'),
                          ),
                          controller: cAliments.sugarsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Lipids'),
                          ),
                          controller: cAliments.lipidsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.requiredDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Saturated fats'),
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
                  // TODO constante (pareil pour ObjectivesPages)
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
