import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../data/models/weighing_model.dart';
import '../../data/providers/database_provider.dart';

class WeighingController extends GetxController {
  final weighings = [].obs;

  late final Isar _db;
  late final StreamSubscription _weighingChanged;

  @override
  Future<void> onInit() async {
    super.onInit();

    _db = await DatabaseProvider.getInstance();

    _weighingChanged = _db.weighings.watchLazy().listen((event) async {
      await getAllWeighings();
    });

    await getAllWeighings();
  }

  // TODO dartz ?
  Future<void> getAllWeighings() async {
    weighings.value = await _db.weighings.where().findAll();
  }

  Future<void> putWeighing() async {
    final newWeighing = Weighing()
      ..date = DateTime.now()
      ..value = 64;

    await _db.writeTxn(() async {
      return await _db.weighings.put(newWeighing);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _weighingChanged.cancel();
  }
}
