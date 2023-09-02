import 'package:get/get.dart';

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
import '../modules/recipes/recipes_binding.dart';
import '../modules/recipes/recipes_pages.dart';
import 'routes.dart';

List<GetPage> pages = [
  GetPage(
    name: aliments,
    page: () => const AlimentsPage(),
    binding: AlimentsBinding(),
  ),
  GetPage(
    name: recipes,
    page: () => const RecipesPage(),
    binding: RecipesBinding(),
  ),
  GetPage(
    name: journal,
    page: () => const JournalPage(),
    binding: JournalBinding(),
    children: [
      GetPage(
        name: weighings,
        page: () => const WeighingsPage(),
        binding: WeighingsBinding(),
      ),
    ],
  ),
  GetPage(
    name: parameters,
    page: () => const ParametersPage(),
    binding: ParametersBinding(),
    children: [
      GetPage(
        name: objectives,
        page: () => const ObjectivesPage(),
        binding: ObjectivesBinding(),
      ),
    ],
  ),
];
