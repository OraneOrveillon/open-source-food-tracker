import 'package:flutter/material.dart';

import '../../../core/utils/paddings.dart';

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
              child: Form(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Calories'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Proteins'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Carbohydrates'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Sugars'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Lipids'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Saturated fat'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Validate'))
          ],
        ),
      ),
    );
  }
}
