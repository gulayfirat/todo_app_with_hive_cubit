part of '../tasks_view.dart';

InkWell _buildAllTaskList(TasksCubit read, BuildContext context) {
  return InkWell(
    onTap: () => FocusScope.of(context).unfocus(),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWaitingTasks(read),
          Visibility(
            visible: read.state.completedTaskList.isNotEmpty ? true : false,
            child: Padding(
              padding: context.normalPadding,
              child: Text(
                LocaleKeys.TasksView_completedText.locale,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          _buildCompletedTask(read)
        ],
      ),
    ),
  );
}

ListView _buildWaitingTasks(TasksCubit read) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: read.state.waitingTaskList.length,
    itemBuilder: (context, index) {
      return TaskCard(
        deleteItem: () async {
          context.router.pop();
          await read.deleteItem(read.state.waitingTaskList[index].id!);
        },
        onTap: () {
          read.bindModelToData(read.state.waitingTaskList[index]);
          _buildShowAddTaskWidget(context, read);
        },
        task: read.state.waitingTaskList[index],
        onChanged: (_) => read.changeIsCompleteTask(read.state.waitingTaskList[index]),
      );
    },
  );
}

ListView _buildCompletedTask(TasksCubit read) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: read.state.completedTaskList.length,
    itemBuilder: (context, index) {
      return TaskCard(
        deleteItem: () async {
          context.router.pop();
          await read.deleteItem(read.state.completedTaskList[index].id!);
        },
        onTap: () {
          read.bindModelToData(read.state.completedTaskList[index]);
          _buildShowAddTaskWidget(context, read);
        },
        task: read.state.completedTaskList[index],
        onChanged: (_) => read.changeIsCompleteTask(read.state.completedTaskList[index]),
      );
    },
  );
}
