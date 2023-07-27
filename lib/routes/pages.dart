import 'package:get/get.dart';

import '../modules/dog/dog_binding.dart';
import '../modules/dog/dog_page.dart';
import 'routes.dart';

// ? Existing routes.
// ? No need to specify the root page.
List<GetPage> pages = [
  GetPage(
    name: dog,
    page: () => const DogPage(),
    binding: DogBinding(),
  ),
];
