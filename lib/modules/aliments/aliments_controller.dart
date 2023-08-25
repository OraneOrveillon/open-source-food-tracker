import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../data/models/aliment_model.dart';
import '../../data/providers/database_provider.dart';

class AlimentsController extends GetxController {
  final aliments = [].obs;

  late final Isar _db;
  late final StreamSubscription _alimentChanged;

  @override
  Future<void> onInit() async {
    super.onInit();

    _db = await DatabaseProvider.getInstance();

    _alimentChanged = _db.aliments.watchLazy().listen((event) async {
      await getAllAliments();
    });

    await getAllAliments();
  }

  Future<void> getAllAliments() async {
    aliments.value = await _db.aliments.where().findAll();
  }

  void putAliment(Aliment aliment) {
    _db.writeTxn(() async {
      return await _db.aliments.put(aliment);
    });
  }

  void deleteAliment(Aliment aliment) {
    _db.writeTxn(() async {
      return await _db.aliments.delete(aliment.id);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _alimentChanged.cancel();
  }
}
