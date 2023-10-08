import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../data/models/aliment_model.dart';
import 'aliment_controller.dart';

class DosesController extends GetxController {
  final AlimentController _cAliment = Get.find<AlimentController>();

  final String initialDose = DropdownValues.doses[0];

  final doses = Rx<List<Dose>>([]);

  @override
  onInit() {
    super.onInit();

    if (_cAliment.aliment?.doses != null) {
      doses.value = _cAliment.aliment!.doses!;
    }
  }

  void addInput() {
    // TODO if le dernier input a bien été rempli
    doses.value = [...doses.value, Dose()];
  }
}
