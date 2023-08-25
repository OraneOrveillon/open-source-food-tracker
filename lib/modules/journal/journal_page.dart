import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/paddings.dart';
import '../../data/models/journal_model.dart';
import '../home/home_controller.dart';
import '../../core/utils/texts.dart';
import 'journal_controller.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<HomeController>(
      builder: (cHome) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppBarTexts.home(cHome.count.value)),
          ),
          body: GetX<JournalController>(
            builder: (cJournal) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cJournal.journals.length,
                      itemBuilder: (_, index) {
                        final Journal journal = cJournal.journals[index];

                        return ListTile(
                            // title: Text(journal.value.toString()),
                            // subtitle: Text(journal.date.toString()),
                            // leading: CircleAvatar(
                            //   child: Text(journal.id.toString()),
                            // ),
                            // trailing: IconButton(
                            //   icon: const Icon(Icons.delete),
                            //   onPressed: () => cJournal.deleteJournal(journal),
                            // ),
                            );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Paddings.medium),
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: const Text('add recipe'),
                          onPressed: () => cJournal.putJournal(Journal()
                              // ..date = DateTime.now()
                              // ..value = 64,
                              ),
                        ),
                        ElevatedButton(
                          child: const Text('add aliment'),
                          onPressed: () => cJournal.putJournal(Journal()
                              // ..date = DateTime.now()
                              // ..value = 64,
                              ),
                        ),
                      ],
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
