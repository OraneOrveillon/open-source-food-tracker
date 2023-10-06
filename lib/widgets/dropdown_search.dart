import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatelessWidget {
  const CustomDropDownSearch({
    super.key,
    required this.dropdownKey,
    required this.label,
    required this.items,
    required this.selectedItems,
    required this.updateFunction,
    required this.searchFieldDecoration,
  });

  final GlobalKey<DropdownSearchState<String>> dropdownKey;
  final String label;
  final List<String> items;
  final List<String> selectedItems;
  final void Function() updateFunction;
  final InputDecoration searchFieldDecoration;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      key: dropdownKey,
      items: items,
      selectedItems: selectedItems,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
        ),
      ),
      dropdownBuilder: (_, selectedItems) => Text(selectedItems.join(', ')),
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
    );
  }
}
