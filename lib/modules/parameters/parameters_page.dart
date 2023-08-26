import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'parameters_controller.dart';

class ParametersPage extends StatelessWidget {
  const ParametersPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('journal'),
            GetBuilder<ParametersController>(
              builder: (cParameters) {
                return ElevatedButton(
                  child: const Text('objectives'),
                  onPressed: () => cParameters.goToObjectives(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
