import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/recipe_model.dart';
import 'recipes_controller.dart';
import '../../../core/utils/texts.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<RecipesController>(
      builder: (cRecipes) => Scaffold(
        appBar: AppBar(
          title: const Text(AppBarTexts.recipes),
        ),
        body: PagedListView<int, Recipe>(
          pagingController: cRecipes.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Recipe>(
            itemBuilder: (_, recipe, index) => ListTile(
              onTap: () => cRecipes.goToEditRecipe(recipe),
              title: Text(recipe.name.toString()),
              subtitle: Text(recipe.creationDate.toString()),
              leading: CircleAvatar(
                child: Text(recipe.id.toString()),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => cRecipes.deleteRecipe(recipe),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => cRecipes.goToAddRecipe(),
        ),
      ),
    );
  }
}
