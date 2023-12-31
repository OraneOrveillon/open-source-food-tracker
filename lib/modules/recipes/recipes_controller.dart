import 'dart:async';

import 'package:get/get.dart';

import '../../../data/models/recipe_model.dart';
import '../../../data/services/recipe_service.dart';
import '../../core/mixins/scroll_pagination_mixin.dart';
import '../../routes/routes.dart';

class RecipesController extends GetxController
    with ScrollPaginationMixin<Recipe> {
  final RecipeService _service = RecipeService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await initPagination(_getLastRecipes);
  }

  Future<List<Recipe>> _getLastRecipes(
    int numberOfRecipesPerRequest,
    int recipesOffset,
  ) async {
    return await _service.getLastRecipesWithOffset(
      numberOfRecipesPerRequest,
      recipesOffset,
    );
  }

  void addRecipeInList(Recipe recipe) {
    addItemInList(recipe);
  }

  void updateRecipeInList(Recipe recipe) {
    updateItemInList(recipe, (element) => recipe.id == element.id);
  }

  // TODO vérifier si la recette a déjà été enregistrée dans une recette
  Future<void> deleteRecipe(Recipe recipe) async {
    await _service.deleteRecipe(recipe);
    deleteItemInList((element) => recipe.id == element.id);
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
