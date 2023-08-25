import 'package:get/get.dart';

import '../modules/aliments/aliments_binding.dart';
import '../modules/aliments/aliments_page.dart';
import '../modules/journal/journal_binding.dart';
import '../modules/journal/journal_page.dart';
import '../modules/weighings/weighings_binding.dart';
import '../modules/weighings/weighings_page.dart';
import 'routes.dart';

// ? Existing routes.
// ? No need to specify the root page.
List<GetPage> pages = [
  GetPage(
    name: aliments,
    page: () => const AlimentsPage(),
    binding: AlimentsBinding(),
  ),
  GetPage(
    name: journal,
    page: () => const JournalPage(),
    binding: JournalBinding(),
  ),
  GetPage(
    name: weighings,
    page: () => const WeighingsPage(),
    binding: WeighingsBinding(),
  ),
];
