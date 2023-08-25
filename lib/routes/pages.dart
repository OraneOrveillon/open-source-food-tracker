import 'package:get/get.dart';

import '../modules/weighings/weighings_binding.dart';
import '../modules/weighings/weighings_page.dart';
import 'routes.dart';

List<GetPage> pages = [
  GetPage(
    name: weighings,
    page: () => const WeighingsPage(),
    binding: WeighingsBinding(),
  ),
];
