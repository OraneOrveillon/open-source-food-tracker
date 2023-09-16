import 'package:get/get.dart';

import '../../../../data/services/aliment_service.dart';

class BrandsController extends GetxController {
  final AlimentService _service = AlimentService();
  final brands = Rx<List<String>>([]);

  @override
  Future<void> onInit() async {
    super.onInit();

    brands.value = await _service.getAllBrandsDistinct();
  }
}
