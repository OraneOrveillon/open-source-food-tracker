import 'package:get/get.dart';

import '../modules/dog/weighing_binding.dart';
import '../modules/dog/weighing_page.dart';
import 'routes.dart';

// ? Existing routes.
// ? No need to specify the root page.
List<GetPage> pages = [
  GetPage(
    name: dog,
    page: () => const WeighingPage(),
    binding: WeighingBinding(),
  ),
];
