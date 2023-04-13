import 'package:flutter/material.dart';

import '../../core/extension/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../extension/context_extension.dart';
import '../mixin/delete_item_dialog.dart';
import '../model/taskModel/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final void Function()? deleteItem;
  final void Function()? onTap;
  final void Function(bool?)? onChanged;
  const TaskCard({
    Key? key,
    required this.task,
    required this.deleteItem,
    required this.onTap,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        DeleteItemDialog.deleteItemDialog(
          context,
          title: LocaleKeys.TasksView_deleteItemDialogTitle.locale,
          onPressed: deleteItem
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: context.border10Radius),
        child: ListTile(
          onTap: onTap,
          leading: Checkbox(value: task.isComplete, onChanged: onChanged),
          title: Text(
            maxLines: 2,
            task.task ?? "",
          ),
        ),
      ),
    );
  }
}
