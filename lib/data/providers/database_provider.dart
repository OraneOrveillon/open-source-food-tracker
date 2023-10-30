import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/aliment_model.dart';
import '../models/journal_model.dart';
import '../models/meal_aliment_model.dart';
import '../models/meal_model.dart';
import '../models/meal_recipe_model.dart';
import '../models/objective_model.dart';
import '../models/recipe_aliment_model.dart';
import '../models/recipe_model.dart';
import '../models/weighing_model.dart';

class DatabaseProvider extends GetxService {
  late Isar db;

  Future<DatabaseProvider> init() async {
    final directory = await getApplicationDocumentsDirectory();

    db = await Isar.open(
      [
        AlimentSchema,
        JournalSchema,
        MealAlimentSchema,
        MealSchema,
        MealRecipeSchema,
        ObjectiveSchema,
        RecipeAlimentSchema,
        RecipeSchema,
        RecipeVariantSchema,
        WeighingSchema,
      ],
      directory: directory.path,
    );
    return this;
  }
}
