part of '../tasks_view.dart';

_buildShowAddTaskWidget(BuildContext context, TasksCubit read) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: context.borderVertical10Radius),
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: context.heighPadding,
              child: CustomTextField(
                hintText: LocaleKeys.TasksView_hintText.locale,
                inputAction: TextInputAction.newline,
                controller: read.taskController,
              ),
            ),
          ),
          IconButton(
            onPressed: () async => await read.addTask().then((_) => context.router.pop()),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
    ),
  );
}
