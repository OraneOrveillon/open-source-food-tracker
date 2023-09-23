import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/weighing_model.dart';
import '../../../data/services/weighing_service.dart';

class WeighingsController extends GetxController {
  final WeighingService _service = WeighingService();

  static const int _numberOfWeighingsPerRequest = 20;
  int _weighingsOffset = 0;

  final PagingController<int, Weighing> pagingController =
      PagingController(firstPageKey: 0);

  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  String? initialValue;

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
    initialValue = weighing?.value.toString() ?? '';

    Get.dialog(dialog);
  }

  void closeDialog() => Get.back();

  Future<List<Weighing>> _getLastWeighings() async {
    final List<Weighing> nextWeighings =
        await _service.getLastWeighingsWithOffset(
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
    if (formKey.currentState!.saveAndValidate()) {
      final Weighing weighing = Weighing()
        ..date = DateTime.now()
        ..value = formKey.currentState?.value[FormKeys.value];

      await _service.putWeighing(weighing);

      pagingController.value.itemList?.insert(0, weighing);
      _fetchPage(0);

      closeDialog();
    }
  }

  Future<void> updateWeighing(Weighing weighing) async {
    if (formKey.currentState!.saveAndValidate()) {
      final newValue = formKey.currentState?.value[FormKeys.value];

      if (weighing.value != newValue) {
        weighing.value = newValue;

        await _service.putWeighing(weighing);

        pagingController.value.itemList?[pagingController.value.itemList!
            .indexWhere((w) => w.id == weighing.id)] = weighing;
        _fetchPage(0);
      }

      closeDialog();
    }
  }

  Future<void> deleteWeighing(Weighing weighing) async {
    await _service.deleteWeighing(weighing);

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

abstract class FormKeys {
  static const String value = 'value';
}
