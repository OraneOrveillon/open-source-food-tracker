import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import '../../core/utils/texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    // ? GetX => access the controller and makes the interface reactive to its properties.
    return GetX<HomeController>(
      builder: (cHome) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppBarTexts.home(cHome.count.value)),
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text(ButtonTexts.toWeighing),
              onPressed: () => cHome.onClick(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => cHome.increment(),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
