import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'weighing_controller.dart';
import '../home/home_controller.dart';
import '../../core/utils/texts.dart';

class WeighingPage extends StatelessWidget {
  const WeighingPage({super.key});

  @override
  Widget build(context) {
    // ? GetBuilder => access the controller without adding reactivity.
    return GetBuilder<HomeController>(
      builder: (cHome) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppBarTexts.home(cHome.count.value)),
          ),
          body: Center(
            child: GetX<WeighingController>(
              builder: (cWeighing) {
                return Column(
                  children: [
                    Text(cWeighing.weighings.toString()),
                    ElevatedButton(
                      onPressed: () async => await cWeighing.putWeighing(),
                      child: const Text(ButtonTexts.addWeighing),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
