import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../data/models/aliment_model.dart';
import 'aliment_controller.dart';

class DosesController extends GetxController {
  final AlimentController _cAliment = Get.find<AlimentController>();

  // TODO voir si besoin de mettre en static
  int inputsId = 0;

  // TODO transformer en selectedDoses
  final String initialDose = DropdownValues.doses[0];
  final inputs = Rx<List<Inputs>>([]);

  final doses = Rx<List<Dose>>([]);

  @override
  onInit() {
    super.onInit();

    if (_cAliment.aliment?.doses != null) {
      doses.value = _cAliment.aliment!.doses!;
    }
  }

  void addInputs() {
    // TODO if le dernier input a bien été rempli
    inputs.value.add(Inputs(id: inputsId, dose: Dose()));
    inputs.refresh();
    inputsId++;
  }

  void removeInputs(Inputs inputs) {
    this.inputs.value.removeWhere(((i) => i.id == inputs.id));
    this.inputs.refresh();
  }
}

class Inputs {
  Inputs({required this.id, required this.dose});

  final int id;
  final Dose dose;
}
