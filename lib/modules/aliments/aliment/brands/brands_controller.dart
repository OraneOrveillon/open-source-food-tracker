import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../data/services/aliment_service.dart';
import '../aliment_controller.dart';

class BrandsController extends GetxController {
  final AlimentService _service = AlimentService();
  final AlimentController cAliment = Get.find<AlimentController>();

  final brands = Rx<List<String>>([]);

  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  @override
  Future<void> onInit() async {
    super.onInit();

    brands.value = await _service.getAllBrandsDistinct();
  }
}

abstract class FormKeys {
  static const String brands = 'brands';
}
