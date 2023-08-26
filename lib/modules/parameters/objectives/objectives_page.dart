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
              child: GetBuilder<ObjectivesController>(builder: (cObjectives) {
                return Form(
                  child: ListView(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Calories'),
                        ),
                        controller: cObjectives.caloriesTEC,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Proteins'),
                        ),
                        controller: cObjectives.proteinsTEC,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Carbohydrates'),
                        ),
                        controller: cObjectives.carbohydratesTEC,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Sugars'),
                        ),
                        controller: cObjectives.sugarsTEC,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Lipids'),
                        ),
                        controller: cObjectives.lipidsTEC,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Saturated fats'),
                        ),
                        controller: cObjectives.saturatedFatsTEC,
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
