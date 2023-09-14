import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lists.dart';
import '../../../core/utils/paddings.dart';
import '../../../core/utils/texts.dart';
import '../../../core/utils/validators.dart';
import 'aliment_controller.dart';

class AlimentPage extends StatelessWidget {
  const AlimentPage({Key? key}) : super(key: key);

  // TODO remove
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlimentController>(
      builder: (cAliment) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => cAliment.onValidateClick(),
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Paddings.medium),
              child: Form(
                key: cAliment.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.name),
                      ),
                      controller: cAliment.nameTEC,
                      keyboardType: TextInputType.text,
                      validator: (value) => Validators.required(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.barcode),
                      ),
                      controller: cAliment.barcodeTEC,
                      keyboardType: TextInputType.number,
                      validator: null,
                    ),
                    // TODO brands
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
                          return option
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        // TODO ajouter la chip
                        debugPrint('You just selected $selection');
                      },
                    ),
                    // TODO categories
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.nutriscore),
                      ),
                      items: DropdownValues.nutriscores
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      value: cAliment.nutriscoreValue,
                      onChanged: (value) => cAliment.nutriscoreValue = value,
                      validator: null,
                    ),
                    // TODO image
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.unit),
                      ),
                      items: DropdownValues.units
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      value: cAliment.unitValue,
                      onChanged: (value) => cAliment.unitValue = value,
                      validator: (value) => Validators.required(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.servingQuantity),
                      ),
                      controller: cAliment.servingQuantityTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.optionalDouble(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.calories),
                      ),
                      controller: cAliment.caloriesTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredInt(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.proteins),
                      ),
                      controller: cAliment.proteinsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredDouble(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.carbohydrates),
                      ),
                      controller: cAliment.carbohydratesTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredDouble(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.sugars),
                      ),
                      controller: cAliment.sugarsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredDouble(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.lipids),
                      ),
                      controller: cAliment.lipidsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredDouble(value),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(InputTexts.saturatedFats),
                      ),
                      controller: cAliment.saturatedFatsTEC,
                      keyboardType: TextInputType.number,
                      validator: (value) => Validators.requiredDouble(value),
                    ),
                    // TODO doses
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
