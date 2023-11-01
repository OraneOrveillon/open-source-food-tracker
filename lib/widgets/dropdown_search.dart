import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'dialog_single_input_form.dart';

class CustomDropdownSearch extends StatelessWidget {
  const CustomDropdownSearch({
    super.key,
    required this.inputName,
    required this.initialValue,
    required this.dropdownKey,
    required this.label,
    required this.items,
    required this.selectedItems,
    required this.updateFunction,
    required this.dialogTitle,
    required this.dialogFormKey,
    required this.dialogAlreadyExistsErrorText,
    required this.onOKClick,
  });

  final String inputName;
  final List<String>? initialValue;
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
    return FormBuilderField(
      name: inputName,
      initialValue: initialValue,
      validator: null,
      valueTransformer: null,
      builder: (field) => DropdownSearch<String>.multiSelection(
        key: dropdownKey,
        items: items,
        selectedItems: selectedItems,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: label,
          ),
        ),
        dropdownBuilder: selectedItems.isNotEmpty
            ? (_, selectedItems) => Text(selectedItems.join(', '))
            : null,
        popupProps: PopupPropsMultiSelection.modalBottomSheet(
          showSelectedItems: true,
          showSearchBox: true,
          searchDelay: Duration.zero,
          validationWidgetBuilder: (_, __) => const SizedBox.shrink(),
          onDismissed: updateFunction,
          searchFieldProps: TextFieldProps(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () => _openDialog(
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
                    onCancelClick: _goBack,
                    onOKClick: onOKClick,
                  ),
                ),
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openDialog(Widget dialog) => Get.dialog(dialog);

  void _goBack() => Get.back();
}
