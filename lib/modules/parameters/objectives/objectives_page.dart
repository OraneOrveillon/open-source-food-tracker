import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/validators.dart';
import 'objectives_controller.dart';

class ObjectivesPage extends StatelessWidget {
  const ObjectivesPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objectives'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.medium),
        child: GetBuilder<ObjectivesController>(
          builder: (cObjectives) {
            return Column(
              children: [
                Expanded(
                  child: Form(
                    key: cObjectives.formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Calories'),
                          ),
                          controller: cObjectives.caloriesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validators.notEmptyInt(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Proteins'),
                          ),
                          controller: cObjectives.proteinsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.notEmptyDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Carbohydrates'),
                          ),
                          controller: cObjectives.carbohydratesTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.notEmptyDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Sugars'),
                          ),
                          controller: cObjectives.sugarsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.notEmptyDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Lipids'),
                          ),
                          controller: cObjectives.lipidsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.notEmptyDouble(value),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Saturated fats'),
                          ),
                          controller: cObjectives.saturatedFatsTEC,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              Validators.notEmptyDouble(value),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => cObjectives.onValidateClick(),
                  child: const Text('Validate'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
