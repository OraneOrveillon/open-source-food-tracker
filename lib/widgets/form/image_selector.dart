import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/texts.dart';
import '../../core/utils/value_transformers.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({
    super.key,
    required this.name,
    required this.initialValue,
    required this.pickImageCallback,
    required this.clearImageFunction,
  });

  final String name;
  final Uint8List? initialValue;
  final Function(Uint8List) pickImageCallback;
  final Function() clearImageFunction;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Get.theme.dividerColor,
        ),
        child: FormBuilderField(
          name: name,
          initialValue: initialValue,
          validator: null,
          valueTransformer: ValueTransformers.imageValue,
          builder: (field) {
            if (field.value != null) {
              return Stack(
                children: [
                  Image(
                    image: MemoryImage(field.value!),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: clearImageFunction,
                      icon: const Icon(Icons.cancel),
                    ),
                  ),
                ],
              );
            }
            return PopupMenuButton(
              icon: const Icon(Icons.add_a_photo),
              onSelected: (value) => _pickImage(value),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: ImageSource.camera,
                  child: Text(ItemTexts.camera),
                ),
                const PopupMenuItem(
                  value: ImageSource.gallery,
                  child: Text(ItemTexts.gallery),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource value) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: value);
    if (image != null) {
      pickImageCallback(await image.readAsBytes());
    }
  }
}
