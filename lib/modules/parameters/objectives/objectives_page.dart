import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
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
        child: Column(
          children: [
            Expanded(
              child: GetX<ObjectivesController>(builder: (cObjectives) {
                return Form(
                  child: ListView(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Calories'),
                        ),
                        controller: cObjectives.caloriesTEC.value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Proteins'),
                        ),
                        controller: cObjectives.proteinsTEC.value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Carbohydrates'),
                        ),
                        controller: cObjectives.carbohydratesTEC.value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Sugars'),
                        ),
                        controller: cObjectives.sugarsTEC.value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Lipids'),
                        ),
                        controller: cObjectives.lipidsTEC.value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Saturated fats'),
                        ),
                        controller: cObjectives.saturatedFatsTEC.value,
                      ),
                    ],
                  ),
                );
              }),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Validate'))
          ],
        ),
      ),
    );
  }
}
