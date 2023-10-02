import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/texts.dart';
import '../../../widgets/dialog_single_input_form.dart';
import 'aliment_controller.dart';

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
              initialValue: cAliment.selectedBrands,
              orientation: OptionsOrientation.vertical,
              options: [
                for (final brand in cAliment.brands.value)
                  FormBuilderFieldOption(
                    value: brand,
                  ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => cAliment.openDialogAddBrand(
              dialog: DialogSingleInputForm(
                title: DialogTexts.addBrand,
                formKey: cAliment.newBrandFormKey,
                inputName: FormKeys.brands,
                initialValue: null,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                valueTransformer: null,
                keyboardType: TextInputType.text,
                onCancelClick: () => cAliment.goBack(),
                onOKClick: () => cAliment.addBrand(),
              ),
            ),
          ),
        );
      },
    );
  }
}
