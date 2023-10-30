import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
    required this.searchFieldDecoration,
  });

  final String inputName;
  final List<String>? initialValue;
  final GlobalKey<DropdownSearchState<String>> dropdownKey;
  final String label;
  final List<String> items;
  final List<String> selectedItems;
  final void Function() updateFunction;
  final InputDecoration searchFieldDecoration;

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
            decoration: searchFieldDecoration,
          ),
        ),
      ),
    );
  }
}
