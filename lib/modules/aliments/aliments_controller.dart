import 'dart:async';

import 'package:get/get.dart';

import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';
import '../../core/mixins/scroll_pagination_mixin.dart';
import '../../routes/routes.dart';

class AlimentsController extends GetxController
    with ScrollPaginationMixin<Aliment> {
  final AlimentService _service = AlimentService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await initPagination(_getLastAliments);
  }

  Future<List<Aliment>> _getLastAliments(
    int numberOfAlimentsPerRequest,
    int alimentsOffset,
  ) async {
    return await _service.getLastAlimentsWithOffset(
      numberOfAlimentsPerRequest,
      alimentsOffset,
    );
  }

  void addAlimentInList(Aliment aliment) {
    addItemInList(aliment);
  }

  void updateAlimentInList(Aliment aliment) {
    updateItemInList(aliment, (element) => aliment.id == element.id);
  }

  // TODO vérifier si l'aliment a déjà été enregistré dans une recette
  Future<void> deleteAliment(Aliment aliment) async {
    await _service.deleteAliment(aliment);
    deleteItemInList((element) => aliment.id == element.id);
  }

  void goToAddAliment() => Get.toNamed(Routes.aliments + Routes.aliment);

  void goToEditAliment(Aliment aliment) =>
      Get.toNamed(Routes.aliments + Routes.aliment, arguments: aliment);

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }
}
