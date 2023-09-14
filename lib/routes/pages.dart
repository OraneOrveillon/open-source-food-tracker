import 'package:get/get.dart';

import '../modules/aliments/aliment/aliment_binding.dart';
import '../modules/aliments/aliment/aliment_page.dart';
import '../modules/aliments/aliment/brands_page.dart';
import '../modules/aliments/aliments_binding.dart';
import '../modules/aliments/aliments_page.dart';
import '../modules/journal/journal_binding.dart';
import '../modules/journal/journal_page.dart';
import '../modules/journal/weighings/weighings_binding.dart';
import '../modules/journal/weighings/weighings_page.dart';
import '../modules/parameters/objectives/objectives_binding.dart';
import '../modules/parameters/objectives/objectives_page.dart';
import '../modules/parameters/parameters_binding.dart';
import '../modules/parameters/parameters_page.dart';
import '../modules/recipes/recipe/recipe_binding.dart';
import '../modules/recipes/recipe/recipe_page.dart';
import '../modules/recipes/recipes_binding.dart';
import '../modules/recipes/recipes_page.dart';
import 'routes.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.aliments,
    page: () => const AlimentsPage(),
    binding: AlimentsBinding(),
    children: [
      GetPage(
        name: Routes.aliment,
        page: () => const AlimentPage(),
        binding: AlimentBinding(),
        children: [
          GetPage(
            name: Routes.brands,
            page: () => const BrandsPage(),
          ),
        ],
      ),
    ],
  ),
  GetPage(
    name: Routes.recipes,
    page: () => const RecipesPage(),
    binding: RecipesBinding(),
    children: [
      GetPage(
        name: Routes.recipe,
        page: () => const RecipePage(),
        binding: RecipeBinding(),
      ),
    ],
  ),
  GetPage(
    name: Routes.journal,
    page: () => const JournalPage(),
    binding: JournalBinding(),
    children: [
      GetPage(
        name: Routes.weighings,
        page: () => const WeighingsPage(),
        binding: WeighingsBinding(),
      ),
    ],
  ),
  GetPage(
    name: Routes.parameters,
    page: () => const ParametersPage(),
    binding: ParametersBinding(),
    children: [
      GetPage(
        name: Routes.objectives,
        page: () => const ObjectivesPage(),
        binding: ObjectivesBinding(),
      ),
    ],
  ),
];
