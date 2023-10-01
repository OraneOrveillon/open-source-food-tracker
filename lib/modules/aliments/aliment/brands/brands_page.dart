import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../core/utils/texts.dart';
import '../aliment_controller.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AlimentController>(
      builder: (cAliment) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => cAliment.updateBrands(),
            ),
            title: const Text(AppBarTexts.brands),
          ),
          body: FormBuilder(
            key: cAliment.brandsFormKey,
            child: FormBuilderCheckboxGroup(
              name: FormKeys.brands,
              initialValue: cAliment.selectedBrands.value,
              orientation: OptionsOrientation.vertical,
              options: [
                for (final brand in cAliment.brands.value)
                  FormBuilderFieldOption(
                    value: brand,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
