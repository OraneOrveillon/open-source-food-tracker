import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../core/mixins/scroll_pagination_mixin.dart';
import '../../../data/models/weighing_model.dart';
import '../../../data/services/weighing_service.dart';

class WeighingsController extends GetxController
    with ScrollPaginationMixin<Weighing> {
  final WeighingService _service = WeighingService();

  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  String? initialValue;

  @override
  Future<void> onInit() async {
    super.onInit();
    await initPagination(_getLastWeighings);
  }

  void openDialog({
    required Weighing? weighing,
    required Widget dialog,
  }) {
    initialValue = weighing?.value.toString() ?? '';

    Get.dialog(dialog);
  }

  void closeDialog() => Get.back();

  Future<List<Weighing>> _getLastWeighings(
    int numberOfWeighingsPerRequest,
    int weighingsOffset,
  ) async {
    return await _service.getLastWeighingsWithOffset(
      numberOfWeighingsPerRequest,
      weighingsOffset,
    );
  }

  Future<void> addWeighing() async {
    if (formKey.currentState!.saveAndValidate()) {
      final Weighing weighing = Weighing()
        ..date = DateTime.now()
        ..value = formKey.currentState?.value[FormKeys.value];

      await _service.putWeighing(weighing);

      addItemInList(weighing);

      closeDialog();
    }
  }

  Future<void> updateWeighing(Weighing weighing) async {
    if (formKey.currentState!.saveAndValidate()) {
      final newValue = formKey.currentState?.value[FormKeys.value];

      if (weighing.value != newValue) {
        weighing.value = newValue;

        await _service.putWeighing(weighing);

        updateItemInList(weighing, (element) => weighing.id == element.id);
      }

      closeDialog();
    }
  }

  Future<void> deleteWeighing(Weighing weighing) async {
    await _service.deleteWeighing(weighing);
    deleteItemInList((element) => weighing.id == element.id);
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
