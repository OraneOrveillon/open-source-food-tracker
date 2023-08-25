import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/paddings.dart';
import '../../data/models/aliment_model.dart';
import 'aliments_controller.dart';
import '../home/home_controller.dart';
import '../../core/utils/texts.dart';

class AlimentsPage extends StatelessWidget {
  const AlimentsPage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<HomeController>(
      builder: (cHome) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppBarTexts.home(cHome.count.value)),
          ),
          body: GetX<AlimentsController>(
            builder: (cAliment) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cAliment.aliments.length,
                      itemBuilder: (_, index) {
                        final Aliment aliment = cAliment.aliments[index];

                        return ListTile(
                          title: Text(aliment.doses.toString()),
                          subtitle: Text(aliment.name.toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => cAliment.deleteAliment(aliment),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Paddings.medium),
                    child: ElevatedButton(
                      child: const Text('add aliment'),
                      onPressed: () => cAliment.putAliment(
                        Aliment()
                          ..name = 'tartine'
                          ..doses = [
                            Dose()
                              ..equivalent = 2
                              ..name = 'cuillère',
                            Dose()
                              ..equivalent = 2.5
                              ..name = 'scoop'
                          ],
                      ),
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
