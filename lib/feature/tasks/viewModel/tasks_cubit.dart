import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/base/base_cache_manager.dart';
import '../../../../product/enum/loading_enum.dart';
import '../../../../product/model/taskModel/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  late final ICacheManager<TaskModel> cacheManager;
  TasksCubit({required this.cacheManager}) : super(const TasksState()) {
    Future.microtask(() async {
      await cacheManager.init();
      await getTasks();
    });
  }

  TextEditingController taskController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  Uuid uuid = const Uuid();

  Future<void> changeIsCompleteTask(TaskModel taskModel) async {
    taskModel.isComplete = !taskModel.isComplete!;
    taskModel.updateDate = DateTime.now();
    await cacheManager.putItem(taskModel.id!, taskModel);
    getTasks();
  }

  void bindModelToData(TaskModel taskModel) {
    emit(state.copyWith(taskModel: taskModel));
    taskController.text = state.taskModel?.task ?? "";
  }

  Future<void> addTask() async {
    TaskModel taskModel = TaskModel(
        id: state.taskModel?.id ?? uuid.v1(),
        createDate: state.taskModel?.createDate ?? DateTime.now(),
        updateDate: DateTime.now(),
        task: taskController.text,
        isComplete: false);

    await cacheManager.putItem(taskModel.id!, taskModel).then((_) {
      getTasks();
      taskController.clear();
      log(taskModel.toString());
    });
  }

  Future<void> getTasks() async {
    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      List<TaskModel> tasks = await cacheManager.getItems() ?? [];
      List<TaskModel> completedTask = [];
      List<TaskModel> waitingTask = [];
      for (var element in tasks) {
        if (element.isComplete == true) {
          completedTask.add(element);
          completedTask.sort((b, a) => a.updateDate!.compareTo(b.updateDate!));
        } else {
          waitingTask.add(element);
          waitingTask.sort((b, a) => a.updateDate!.compareTo(b.updateDate!));
        }
      }
      emit(state.copyWith(waitingTaskList: waitingTask, completedTaskList: completedTask, loadingStatus: LoadingStatus.success));
    } on Exception catch (e) {
      log(e.toString());
      emit(state.copyWith(loadingStatus: LoadingStatus.failure));
    }
  }

  void searchTasks(String query) {
    if (query.isNotEmpty) {
      List<TaskModel> waitingTaskList =
          state.waitingTaskList.where((element) => element.task?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
      List<TaskModel> completedTaskList =
          state.completedTaskList.where((element) => element.task?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
      emit(state.copyWith(waitingTaskList: waitingTaskList, completedTaskList: completedTaskList));
    } else {
      getTasks();
    }
  }

  Future<void> deleteItem(String id) async {
    await cacheManager.removeItem(id).then((value) => getTasks());
  }
}
