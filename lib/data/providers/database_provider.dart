import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/weighing_model.dart';

class DatabaseProvider {
  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance == null) {
      final directory = await getApplicationDocumentsDirectory();

      _instance = await Isar.open(
        [
          WeighingSchema,
        ],
        directory: directory.path,
      );
    }

    return _instance!;
  }

  // TODO méthodes d'ajout / modification etc standardisées

  DatabaseProvider._();
}
