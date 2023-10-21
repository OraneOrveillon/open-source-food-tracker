import 'dart:async';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/recipe_model.dart';
import '../../../data/services/recipe_service.dart';
import '../../routes/routes.dart';

class RecipesController extends GetxController {
  final RecipeService _service = RecipeService();

  static const int _numberOfRecipesPerRequest = 20;
  int _recipesOffset = 0;

  final PagingController<int, Recipe> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<List<Recipe>> _getLastRecipes() async {
    final List<Recipe> nextRecipes = await _service.getLastRecipesWithOffset(
      _numberOfRecipesPerRequest,
      _recipesOffset,
    );

    _recipesOffset += _numberOfRecipesPerRequest;

    return nextRecipes;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Recipe> nextRecipes = await _getLastRecipes();
      final isLastPage = nextRecipes.length < _numberOfRecipesPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(nextRecipes);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(nextRecipes, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  void addRecipeInList(Recipe recipe) {
    pagingController.value.itemList?.insert(0, recipe);
    _fetchPage(0);
  }

  void updateRecipeInList(Recipe recipe) {
    pagingController.value.itemList?[pagingController.value.itemList!
        .indexWhere((a) => a.id == recipe.id)] = recipe;
    _fetchPage(0);
  }

  // TODO vérifier si la recette a déjà été enregistrée dans une recette
  Future<void> deleteRecipe(Recipe recipe) async {
    await _service.deleteRecipe(recipe);

    pagingController.value.itemList
        ?.removeWhere((Recipe a) => a.id == recipe.id);
    _fetchPage(0);
  }

  void goToAddRecipe() => Get.toNamed(Routes.recipes + Routes.recipe);

  void goToEditRecipe(Recipe recipe) => Get.toNamed(
        Routes.recipes + Routes.recipe,
        arguments: recipe,
      );

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }
}
