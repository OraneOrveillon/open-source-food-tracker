import 'dart:typed_data';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../core/utils/enums.dart';
import '../../../data/models/aliment_model.dart';
import '../../../data/models/recipe_model.dart';
import '../../../data/services/recipe_service.dart';
import '../../../routes/routes.dart';
import '../recipes_controller.dart';

class RecipeController extends GetxController {
  final RecipeService _service = RecipeService();
  final RecipesController cRecipes = Get.find<RecipesController>();
  Recipe? recipe = Get.arguments;

  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  final GlobalKey<FormBuilderState> newTagFormKey = GlobalKey();

  final GlobalKey<DropdownSearchState<String>> tagsDropdownKey = GlobalKey();

  String? initialName;
  List<String>? initialTags = [];
  Uint8List? initialImage;
  String? initialPortions = '1';
  String? initialDescription;

  final tags = Rx<List<String>>([]);
  final _selectedTags = Rx<List<String>>([]);

  final aliments = Rx<List<Aliment>>([]);

  @override
  Future<void> onInit() async {
    super.onInit();

    if (recipe != null) {
      initialName = recipe!.name;
      initialTags = recipe!.tags;
      if (recipe!.image != null) {
        initialImage = Uint8List.fromList(recipe!.image!);
      }
      initialPortions = recipe!.portions.toString();
      initialDescription = recipe!.description;

      _selectedTags.value = recipe!.tags ?? [];
    }

    tags.value = await _service.getAllTagsDistinct();
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

  void updateTags() {
    _selectedTags.value = _selectedTagsInPopup;
    formKey.currentState!.patchValue({FormKeys.tags: _selectedTagsInPopup});
  }

  void addNewTag() {
    if (newTagFormKey.currentState!.saveAndValidate()) {
      final String newTag = newTagFormKey.currentState?.value[FormKeys.tags];

      if (!tags.value.contains(newTag)) {
        tags.value.insert(0, newTag);
        tagsDropdownKey.currentState!.getPopupState!.selectItems([newTag]);

        goBack();
        goBack();
      }
    }
  }

  Future<void> updateImage(Uint8List image) async {
    formKey.currentState!.patchValue({FormKeys.image: image});
  }

  void clearImage() => formKey.currentState!.patchValue({FormKeys.image: null});

  Future<void> onAddAlimentClick() async {
    final aliment = await Get.toNamed(
      Routes.recipes + Routes.recipe + Routes.aliments,
      arguments: AlimentsPageMode.recipeModule,
    );

    // TODO et que l'aliment n'existe pas déjà dans la liste
    if (aliment != null) {
      aliments.value.add(aliment);
      aliments.refresh();
    }
  }

  void onRemoveAlimentClick(Aliment aliment) {
    aliments.value.removeWhere((element) => element.id == aliment.id);
    aliments.refresh();
  }

  void goBack() => Get.back();

  /// Returns sorted [_selectedTags].
  List<String> get selectedTags {
    List<String> categories = _selectedTags.value;
    categories.sort();
    return categories;
  }

  /// Returns currently selected items in the tags popup.
  List<String> get _selectedTagsInPopup {
    return tagsDropdownKey.currentState!.getPopupState!.getSelectedItem;
  }
}

abstract class FormKeys {
  static const String name = 'name';
  static const String tags = 'tags';
  static const String image = 'image';
  static const String portions = 'portions';
  static const String description = 'description';
  static const String aliments = 'aliments';
}
