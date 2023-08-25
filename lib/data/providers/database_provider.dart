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

class DatabaseProvider {
  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance == null) {
      final directory = await getApplicationDocumentsDirectory();

      _instance = await Isar.open(
        [
          AlimentSchema,
          JournalSchema,
          MealAlimentSchema,
          MealSchema,
          MealRecipeSchema,
          ObjectiveSchema,
          RecipeAlimentSchema,
          RecipeSchema,
          WeighingSchema,
        ],
        directory: directory.path,
      );
    }

    return _instance!;
  }

  DatabaseProvider._();
}
