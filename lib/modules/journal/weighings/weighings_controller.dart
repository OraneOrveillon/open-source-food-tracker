import 'dart:async';

import 'package:flutter/material.dart';
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

  final valueTEC = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  void openDialog({
    required Weighing? weighing,
    required Widget dialog,
  }) {
    valueTEC.text = weighing?.value.toString() ?? '';

    Get.dialog(dialog);
  }

  void closeDialog() => Get.back();

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

  Future<void> addWeighing() async {
    final Weighing weighing = Weighing()
      ..date = DateTime.now()
      ..value = double.parse(valueTEC.text);

    await _putWeighingDB(weighing);

    pagingController.value.itemList?.insert(0, weighing);
    _fetchPage(0);

    closeDialog();
  }

  Future<void> updateWeighing(Weighing weighing) async {
    weighing.value = double.parse(valueTEC.text);

    await _putWeighingDB(weighing);

    // TODO voir si meilleure méthode
    pagingController
        .value
        .itemList?[pagingController.value.itemList!
            .indexWhere((w) => w.id == weighing.id)]
        .value = weighing.value;
    _fetchPage(0);

    closeDialog();
  }

  Future<void> _putWeighingDB(Weighing weighing) async {
    _db.writeTxn(() async {
      await _db.weighings.put(weighing);
    });
  }

  Future<void> deleteWeighingDB(Weighing weighing) async {
    _db.writeTxn(() async {
      await _db.weighings.delete(weighing.id);
    });

    // TODO pareil bouger dans une autre méthode
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
