import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../widgets/dialog_single_input_form.dart';
import '../../../../widgets/dropdown_search.dart';

class DropdownSearchBrandsAndCategories extends StatelessWidget {
  const DropdownSearchBrandsAndCategories({
    Key? key,
    required this.inputName,
    required this.dropdownKey,
    required this.label,
    required this.items,
    required this.selectedItems,
    required this.updateFunction,
    required this.dialogTitle,
    required this.dialogFormKey,
    required this.dialogAlreadyExistsErrorText,
    required this.onOKClick,
  }) : super(key: key);

  final String inputName;
  final GlobalKey<DropdownSearchState<String>> dropdownKey;
  final String label;
  final List<String> items;
  final List<String> selectedItems;
  final void Function() updateFunction;
  final String dialogTitle;
  final GlobalKey<FormBuilderState> dialogFormKey;
  final String dialogAlreadyExistsErrorText;
  final void Function() onOKClick;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownSearch(
      inputName: inputName,
      dropdownKey: dropdownKey,
      label: label,
      items: items,
      selectedItems: selectedItems,
      updateFunction: updateFunction,
      searchFieldDecoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () => openDialog(
            DialogSingleInputForm(
              title: dialogTitle,
              formKey: dialogFormKey,
              inputName: inputName,
              initialValue: null,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                ...items
                    .map((brand) => FormBuilderValidators.notEqual(
                          brand,
                          errorText: dialogAlreadyExistsErrorText,
                        ))
                    .toList(),
              ]),
              valueTransformer: null,
              keyboardType: TextInputType.text,
              onCancelClick: goBack,
              onOKClick: onOKClick,
            ),
          ),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  void openDialog(Widget dialog) => Get.dialog(dialog);

  void goBack() => Get.back();
}
