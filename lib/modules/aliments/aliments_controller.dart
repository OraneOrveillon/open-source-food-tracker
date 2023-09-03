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
  Future<void> onInit() async {
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

  // TODO vérifier si l'aliment a déjà été enregistré dans une recette
  Future<void> deleteAliment(Aliment aliment) async {
    await _service.deleteAliment(aliment);

    pagingController.value.itemList
        ?.removeWhere((Aliment w) => w.id == aliment.id);
    _fetchPage(0);
  }

  void goToAliment() => Get.toNamed(aliments + aliment);

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }
}
