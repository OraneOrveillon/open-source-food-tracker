import 'dart:async';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:isar/isar.dart';

import '../../../data/models/weighing_model.dart';
import '../../home/home_controller.dart';

class WeighingsController extends GetxController {
  final Isar _db = Get.find<HomeController>().database;

  static const int _numberOfWeighingsPerRequest = 20;
  int _weighingsOffset = 0;

  final PagingController<int, Weighing> pagingController =
      PagingController(firstPageKey: 0);

  @override
  Future<void> onInit() async {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<List<Weighing>> _getLastWeighings() async {
    final List<Weighing> nextWeighings = await _db.weighings
        .where()
        .sortByDateDesc()
        .offset(_weighingsOffset)
        .limit(_numberOfWeighingsPerRequest)
        .findAll();

    _weighingsOffset += _numberOfWeighingsPerRequest;

    return nextWeighings;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Weighing> nextWeighings = await _getLastWeighings();
      final isLastPage = nextWeighings.length < _numberOfWeighingsPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(nextWeighings);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(nextWeighings, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<void> putWeighing(Weighing weighing) async {
    _db.writeTxn(() async {
      await _db.weighings.put(weighing);
    });

    pagingController.value.itemList?.insert(0, weighing);
    _fetchPage(0);
  }

  Future<void> deleteWeighing(Weighing weighing) async {
    _db.writeTxn(() async {
      await _db.weighings.delete(weighing.id);
    });

    pagingController.value.itemList
        ?.removeWhere((Weighing w) => w.id == weighing.id);
    _fetchPage(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }
}
