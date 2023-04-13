import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/extension/context_extension.dart';
import '../../../../product/manager/task_manager.dart';
import '../../../../product/widget/custom_floating_button.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/component/search_text_field.dart';
import '../../../product/component/task_card_component.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/constant/string_constant.dart';
import '../../../product/enum/loading_enum.dart';
import '../../../product/widget/custom_text_field.dart';
import '../viewModel/tasks_cubit.dart';

part './subView/add_task.dart';
part './subView/all_task_list.dart';

@RoutePage()
class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final GlobalKey expansionTileKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(cacheManager: TaskCacheManager(boxName: HiveConstants.taskBoxName)),
      child: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {},
        builder: (context, state) {
          var read = context.read<TasksCubit>();
          return SafeArea(
            child: Scaffold(
              floatingActionButton: CustomFloatingButton(
                tag: StringConstant.instance.taskTag,
                onPressed: () {
                  read.taskController.clear();
                  _buildShowAddTaskWidget(context, read);
                },
              ),
              body: _buildBody(context, read),
            ),
          );
        },
      ),
    );
  }

  _buildBody(BuildContext context, TasksCubit read) {
    return read.state.loadingStatus == LoadingStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : read.state.loadingStatus == LoadingStatus.success
            ? Padding(
                padding: context.pagePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchTextField(
                      controller: read.searchController,
                      hintText: LocaleKeys.TasksView_searchText.locale,
                      onChanged: (value) => read.searchTasks(value),
                    ),
                    Expanded(
                      child: _buildAllTaskList(read, context),
                    )
                  ],
                ),
              )
            : const Center(child: Text("Error"));
  }
}
