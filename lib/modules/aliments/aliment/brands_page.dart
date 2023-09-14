import 'package:flutter/material.dart';

import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({Key? key}) : super(key: key);

  // TODO remove
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppBarTexts.brands),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Autocomplete<String>(
                fieldViewBuilder: (
                  context,
                  textEditingController,
                  focusNode,
                  function,
                ) =>
                    TextFormField(
                  onFieldSubmitted: (value) => {
                    // TODO ajouter la chip
                  },
                  decoration: const InputDecoration(
                    label: Text(InputTexts.brands),
                  ),
                  controller: textEditingController,
                  focusNode: focusNode,
                  validator: null,
                ),
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _kOptions.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  // TODO ajouter la chip
                  debugPrint('You just selected $selection');
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('New brand'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
