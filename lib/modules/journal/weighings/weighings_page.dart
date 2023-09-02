import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/utils/paddings.dart';
import '../../../data/models/weighing_model.dart';
import 'weighings_controller.dart';
import '../../../core/utils/texts.dart';
import 'widgets/dialog_weighing_form.dart';

class WeighingsPage extends StatelessWidget {
  const WeighingsPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('weighings'),
      ),
      body: GetBuilder<WeighingsController>(
        builder: (cWeighings) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PagedListView<int, Weighing>(
                  pagingController: cWeighings.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Weighing>(
                    itemBuilder: (_, weighing, index) => ListTile(
                      onTap: () => cWeighings.openDialog(
                        weighing: weighing,
                        dialog: DialogWeighingForm(
                          title: 'Edit',
                          onCancelClick: () => cWeighings.closeDialog(),
                          onOKClick: () => cWeighings.updateWeighing(weighing),
                        ),
                      ),
                      title: Text(weighing.value.toString()),
                      subtitle: Text(weighing.date.toString()),
                      leading: CircleAvatar(
                        child: Text(weighing.id.toString()),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cWeighings.deleteWeighingDB(weighing),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Paddings.medium),
                child: ElevatedButton(
                  child: const Text(ButtonTexts.addWeighing),
                  onPressed: () => cWeighings.openDialog(
                    weighing: null,
                    dialog: DialogWeighingForm(
                      title: 'Add',
                      onCancelClick: () => cWeighings.closeDialog(),
                      onOKClick: () => cWeighings.addWeighing(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
