import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'data/models/user.dart';
import 'modules/home/home_binding.dart';
import 'routes/pages.dart';
import 'modules/home/home_page.dart';
import 'core/theme/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ! *** Base de données *** ! //
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [UserSchema],
    directory: dir.path,
  );

  final newUser = User()
    ..name = 'Jane Doe'
    ..age = 36;

  await isar.writeTxn(() async {
    await isar.users.put(newUser);
  });

  // final existingUser = await isar.users.get(newUser.id);

  // await isar.writeTxn(() async {
  //   await isar.users.delete(existingUser!.id);
  // });
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
