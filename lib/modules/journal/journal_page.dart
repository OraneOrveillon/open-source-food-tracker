import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'journal_controller.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('journal'),
            GetBuilder<JournalController>(
              builder: (cJournal) {
                return ElevatedButton(
                  child: const Text('weighings'),
                  onPressed: () => cJournal.goToWeighings(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
