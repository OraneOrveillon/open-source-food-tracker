import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/recipe_model.dart';
import '../../../data/services/recipe_service.dart';
import '../recipes_controller.dart';

class RecipeController extends GetxController {
  final RecipeService _service = RecipeService();
  final RecipesController cRecipes = Get.find<RecipesController>();
  Recipe? recipe = Get.arguments;

  final GlobalKey<FormState> formKey = GlobalKey();

  final nameTEC = TextEditingController();
  final portionsTEC = TextEditingController(text: '1');
  final descriptionTEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (recipe != null) {
      nameTEC.text = recipe!.name!;
      portionsTEC.text = recipe!.portions!.toString();
      descriptionTEC.text = recipe!.description!;
    }
  }

  void onValidateClick() => recipe == null ? addRecipe() : updateRecipe();

  // TODO calcul automatique des macros
  Future<void> addRecipe() async {
    if (formKey.currentState!.validate()) {
      final Recipe recipe = Recipe()
        ..creationDate = DateTime.now()
        ..name = nameTEC.text
        ..portions = int.parse(portionsTEC.text)
        ..description = descriptionTEC.text
        ..deleted = false;

      await _service.putRecipe(recipe);

      cRecipes.addRecipeInList(recipe);

      goBack();
    }
  }

  // TODO vérifier
  // TODO mettre à jour les macros si les aliments ont changé
  Future<void> updateRecipe() async {
    if (formKey.currentState!.validate()) {
      // final Recipe newRecipe = recipe!.copyWith(
      //   name: nameTEC.text,
      // );

      // if (newRecipe != recipe) {
      //   await _service.putRecipe(newRecipe..updateDate = DateTime.now());
      // }

      // cRecipes.updateRecipeInList(newRecipe);

      goBack();
    }
  }

  void goBack() => Get.back();

  @override
  void onClose() {
    super.onClose();
    nameTEC.dispose();
    portionsTEC.dispose();
    descriptionTEC.dispose();
  }
}
