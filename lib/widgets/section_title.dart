import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/paddings.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.isFirstSection = false,
  });

  final String title;
  final bool isFirstSection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirstSection ? Paddings.medium : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isFirstSection ? const Divider() : const SizedBox.shrink(),
          Text(
            title,
            style: Get.theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
