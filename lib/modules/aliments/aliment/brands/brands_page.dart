import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
          return FormBuilder(
            key: cBrands.formKey,
            child: FormBuilderCheckboxGroup(
              name: FormKeys.brands,
              initialValue: cBrands.cAliment.aliment?.brands,
              orientation: OptionsOrientation.vertical,
              options: [
                for (final brand in cBrands.brands.value)
                  FormBuilderFieldOption(
                    value: brand,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
