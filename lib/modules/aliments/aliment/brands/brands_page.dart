import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/texts.dart';
import 'brands_controller.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppBarTexts.brands),
      ),
      body: GetX<BrandsController>(
        builder: (cBrands) {
          return ListView.builder(
            itemCount: cBrands.brands.value.length,
            itemBuilder: (context, index) => CheckboxListTile(
              title: Text(cBrands.brands.value[index]),
              value: false,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
