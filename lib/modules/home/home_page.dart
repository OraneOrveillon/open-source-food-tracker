import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<HomeController>(
      builder: (cHome) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('home'),
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text('aliments'),
                  onPressed: () => cHome.goToAliments(),
                ),
                ElevatedButton(
                  child: const Text('recipes'),
                  onPressed: () => cHome.goToRecipes(),
                ),
                ElevatedButton(
                  child: const Text('journal'),
                  onPressed: () => cHome.goToJournal(),
                ),
                ElevatedButton(
                  child: const Text('parameters'),
                  onPressed: () => cHome.goToParameters(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
