import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/aliment_model.dart';
import '../../core/utils/enums.dart';
import 'aliments_controller.dart';
import '../../../core/utils/texts.dart';

class AlimentsPage extends StatelessWidget {
  const AlimentsPage({super.key});

  @override
  Widget build(context) {
    return GetBuilder<AlimentsController>(
      builder: (cAliments) => Scaffold(
        appBar: AppBar(
          title: const Text(AppBarTexts.aliments),
        ),
        body: PagedListView<int, Aliment>(
          pagingController: cAliments.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Aliment>(
            itemBuilder: (_, aliment, index) => ListTile(
              onTap: () => cAliments.onAlimentClick(aliment),
              title: Text(aliment.name.toString()),
              subtitle: Text(aliment.creationDate.toString()),
              leading: CircleAvatar(
                child: Text(aliment.id.toString()),
              ),
              trailing: _buildListTileTrailing(cAliments, aliment),
            ),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(cAliments),
      ),
    );
  }

  Widget? _buildListTileTrailing(
    AlimentsController cAliments,
    Aliment aliment,
  ) {
    if (cAliments.pageMode == AlimentsPageMode.alimentsModule) {
      return IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => cAliments.deleteAliment(aliment),
      );
    }

    return null;
  }

  Widget? _buildFloatingActionButton(AlimentsController cAliments) {
    if (cAliments.pageMode == AlimentsPageMode.alimentsModule) {
      return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => cAliments.onAddClick(),
      );
    }

    return null;
  }
}
