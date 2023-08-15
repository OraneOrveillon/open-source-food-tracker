import 'package:flutter/material.dart';
import 'package:flutter_template/data/providers/database_provider.dart';
import 'package:get/get.dart';

import 'data/models/weighing_model.dart';
import 'modules/home/home_binding.dart';
import 'routes/pages.dart';
import 'modules/home/home_page.dart';
import 'core/theme/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ! *** Base de données *** ! //
  final db = await DatabaseProvider.getInstance();

  final newWeighing = Weighing()
    ..date = DateTime.now()
    ..value = 64;

  await db.writeTxn(() async {
    await db.weighings.put(newWeighing);
  });
  // ! *** *** ! //

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialBinding: HomeBinding(),
      getPages: pages,
      theme: lightTheme,
      darkTheme: darkTheme,
    ),
  );
}
