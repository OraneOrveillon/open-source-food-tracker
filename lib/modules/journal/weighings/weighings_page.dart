import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/paddings.dart';
import '../../../data/models/weighing_model.dart';
import 'weighings_controller.dart';
import '../../../core/utils/texts.dart';

class WeighingsPage extends StatelessWidget {
  const WeighingsPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetX<WeighingsController>(
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
                  onPressed: () => cWeighing.putWeighing(
                    Weighing()
                      ..date = DateTime.now()
                      ..value = 64,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
