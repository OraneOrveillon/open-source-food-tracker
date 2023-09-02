import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/weighing_model.dart';
import '../../../data/services/weighings_service.dart';

class WeighingsController extends GetxController {
  final WeighingService weighingService = WeighingService();

  static const int _numberOfWeighingsPerRequest = 20;
  int _weighingsOffset = 0;

  final PagingController<int, Weighing> pagingController =
      PagingController(firstPageKey: 0);

  final GlobalKey<FormState> formKey = GlobalKey();
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
    final List<Weighing> nextWeighings =
        await weighingService.getLastWeighingsWithOffset(
      _numberOfWeighingsPerRequest,
      _weighingsOffset,
    );

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
    if (formKey.currentState!.validate()) {
      final Weighing weighing = Weighing()
        ..date = DateTime.now()
        ..value = double.parse(valueTEC.text);

      await weighingService.putWeighing(weighing);

      pagingController.value.itemList?.insert(0, weighing);
      _fetchPage(0);

      closeDialog();
    }
  }

  Future<void> updateWeighing(Weighing weighing) async {
    if (formKey.currentState!.validate()) {
      weighing.value = double.parse(valueTEC.text);

      await weighingService.putWeighing(weighing);

      // TODO voir si meilleure méthode
      pagingController
          .value
          .itemList?[pagingController.value.itemList!
              .indexWhere((w) => w.id == weighing.id)]
          .value = weighing.value;
      _fetchPage(0);

      closeDialog();
    }
  }

  Future<void> deleteWeighing(Weighing weighing) async {
    await weighingService.deleteWeighing(weighing);

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
