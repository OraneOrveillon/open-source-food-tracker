import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/validators.dart';
import 'objectives_controller.dart';

class ObjectivesPage extends StatelessWidget {
  const ObjectivesPage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<ObjectivesController>(
      builder: (cObjectives) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppBarTexts.objectives),
            actions: [
              IconButton(
                onPressed: () => cObjectives.onValidateClick(),
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
              child: Form(
                key: cObjectives.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.calories),
                      ),
                      controller: cObjectives.caloriesTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.proteins),
                      ),
                      controller: cObjectives.proteinsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.carbohydrates),
                      ),
                      controller: cObjectives.carbohydratesTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.sugars),
                      ),
                      controller: cObjectives.sugarsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.lipids),
                      ),
                      controller: cObjectives.lipidsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.saturatedFats),
                      ),
                      controller: cObjectives.saturatedFatsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
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
