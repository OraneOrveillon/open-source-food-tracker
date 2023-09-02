import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/aliment_model.dart';
import '../../../data/services/aliment_service.dart';

class AlimentsController extends GetxController {
  final AlimentService _service = AlimentService();

  static const int _numberOfAlimentsPerRequest = 20;
  int _alimentsOffset = 0;

  final PagingController<int, Aliment> pagingController =
      PagingController(firstPageKey: 0);

  final GlobalKey<FormState> formKey = GlobalKey();
  // final valueTEC = TextEditingController();

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

  Future<void> addAliment() async {
    if (formKey.currentState!.validate()) {
      final Aliment aliment = Aliment();
      // ..date = DateTime.now()
      // ..value = double.parse(valueTEC.text);

      await _service.putAliment(aliment);

      pagingController.value.itemList?.insert(0, aliment);
      _fetchPage(0);
    }
  }

  // TODO vérifier qu'au moins une valeur est différente
  // TODO mettre à jour updateDate
  // TODO mettre à jour les macros des recettes si l'aliment a déjà été enregistré dans une recette
  Future<void> updateAliment(Aliment aliment) async {
    if (formKey.currentState!.validate()) {
      // aliment.value = double.parse(valueTEC.text);

      await _service.putAliment(aliment);

      pagingController.value.itemList?[pagingController.value.itemList!
          .indexWhere((w) => w.id == aliment.id)] = aliment;

      _fetchPage(0);
    }
  }

  // TODO vérifier si l'aliment a déjà été enregistré dans une recette
  Future<void> deleteAliment(Aliment aliment) async {
    await _service.deleteAliment(aliment);

    pagingController.value.itemList
        ?.removeWhere((Aliment w) => w.id == aliment.id);
    _fetchPage(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
    // valueTEC.dispose();
  }
}
