import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../data/models/journal_model.dart';
import '../../data/providers/database_provider.dart';

class JournalController extends GetxController {
  final journals = [].obs;

  late final Isar _db;
  late final StreamSubscription _alimentChanged;

  @override
  Future<void> onInit() async {
    super.onInit();

    _db = await DatabaseProvider.getInstance();

    _alimentChanged = _db.journals.watchLazy().listen((event) async {
      await getAllJournals();
    });

    await getAllJournals();
  }

  Future<void> getAllJournals() async {
    journals.value = await _db.journals.where().findAll();
  }

  void putJournal(Journal aliment) {
    _db.writeTxn(() async {
      return await _db.journals.put(aliment);
    });
  }

  void deleteJournal(Journal aliment) {
    _db.writeTxn(() async {
      return await _db.journals.delete(aliment.id);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _alimentChanged.cancel();
  }
}
