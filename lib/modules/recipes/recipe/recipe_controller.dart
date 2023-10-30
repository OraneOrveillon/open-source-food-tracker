import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../data/models/recipe_model.dart';
import '../../../data/services/recipe_service.dart';
import '../recipes_controller.dart';

class RecipeController extends GetxController {
  final RecipeService _service = RecipeService();
  final RecipesController cRecipes = Get.find<RecipesController>();
  Recipe? recipe = Get.arguments;

  final GlobalKey<FormBuilderState> formKey = GlobalKey();

  String? initialName;
  String? initialPortions = '1';
  String? initialDescription;

  @override
  void onInit() {
    super.onInit();

    if (recipe != null) {
      initialName = recipe!.name;
      initialPortions = recipe!.portions.toString();
      initialDescription = recipe!.description;
    }
  }

  void onValidateClick() => recipe == null ? addRecipe() : updateRecipe();

  // TODO calcul automatique des macros
  Future<void> addRecipe() async {
    if (formKey.currentState!.saveAndValidate()) {
      final formValues = formKey.currentState!.value;

      // final Recipe recipe = Recipe()
      //   ..creationDate = DateTime.now()
      //   ..name = formValues[FormKeys.name]
      //   ..portions = formValues[FormKeys.portions]
      //   ..description = formValues[FormKeys.description]
      //   ..deleted = false;

      // await _service.putRecipe(recipe);

      // cRecipes.addRecipeInList(recipe);

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
}

abstract class FormKeys {
  static const String name = 'name';
  static const String portions = 'portions';
  static const String description = 'description';
}
