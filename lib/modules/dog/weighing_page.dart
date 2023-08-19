import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/paddings.dart';
import '../../data/models/weighing_model.dart';
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
          body: GetX<WeighingController>(
            builder: (cWeighing) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cWeighing.weighings.length,
                      itemBuilder: (_, index) {
                        final Weighing weighing = cWeighing.weighings[index];

                        return ListTile(
                          title: Text(weighing.value.toString()),
                          subtitle: Text(weighing.date.toString()),
                          leading: CircleAvatar(
                            child: Text(weighing.id.toString()),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => cWeighing.deleteWeighing(weighing),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Paddings.medium),
                    child: ElevatedButton(
                      child: const Text(ButtonTexts.addWeighing),
                      onPressed: () => cWeighing.putWeighing(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
