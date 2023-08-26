import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../data/models/weighing_model.dart';
import '../../home/home_controller.dart';

class WeighingsController extends GetxController {
  final Isar _db = Get.find<HomeController>().database;
  late final StreamSubscription _weighingChanged;

  final weighings = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    _weighingChanged = _db.weighings.watchLazy().listen((event) async {
      await getAllWeighings();
    });

    await getAllWeighings();
  }

  Future<void> getAllWeighings() async {
    weighings.value = await _db.weighings.where().findAll();
  }

  void putWeighing(Weighing weighing) {
    _db.writeTxn(() async {
      await _db.weighings.put(weighing);
    });
  }

  void deleteWeighing(Weighing weighing) {
    _db.writeTxn(() async {
      await _db.weighings.delete(weighing.id);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _weighingChanged.cancel();
  }
}
