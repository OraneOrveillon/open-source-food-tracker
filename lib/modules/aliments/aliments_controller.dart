import 'dart:async';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';
import '../../routes/routes.dart';

class AlimentsController extends GetxController {
  final AlimentService _service = AlimentService();

  static const int _numberOfAlimentsPerRequest = 20;
  int _alimentsOffset = 0;

  final PagingController<int, Aliment> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<List<Aliment>> _getLastAliments() async {
    final List<Aliment> nextAliments = await _service.getLastAlimentsWithOffset(
      _numberOfAlimentsPerRequest,
      _alimentsOffset,
    );

    _alimentsOffset += _numberOfAlimentsPerRequest;

    return nextAliments;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Aliment> nextAliments = await _getLastAliments();
      final isLastPage = nextAliments.length < _numberOfAlimentsPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(nextAliments);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(nextAliments, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  void addAlimentInList(Aliment aliment) {
    pagingController.value.itemList?.insert(0, aliment);
    _fetchPage(0);
  }

  void updateAlimentInList(Aliment aliment) {
    pagingController.value.itemList?[pagingController.value.itemList!
        .indexWhere((a) => a.id == aliment.id)] = aliment;
    _fetchPage(0);
  }

  // TODO vérifier si l'aliment a déjà été enregistré dans une recette
  Future<void> deleteAliment(Aliment aliment) async {
    await _service.deleteAliment(aliment);

    pagingController.value.itemList
        ?.removeWhere((Aliment a) => a.id == aliment.id);
    _fetchPage(0);
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
