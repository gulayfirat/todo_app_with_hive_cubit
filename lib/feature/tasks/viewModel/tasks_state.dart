part of 'tasks_cubit.dart';

@immutable
class TasksState extends Equatable {
  const TasksState({
    this.taskModel,
    this.waitingTaskList = const [],
    this.completedTaskList = const [],
    this.loadingStatus = LoadingStatus.initial,
    this.selectedIndex,
  });

  final TaskModel? taskModel;
  final List<TaskModel> waitingTaskList;
  final List<TaskModel> completedTaskList;
  final LoadingStatus? loadingStatus;
  final int? selectedIndex;
  @override
  List<Object?> get props => [taskModel, waitingTaskList, completedTaskList, loadingStatus, selectedIndex];

  TasksState copyWith({
    TaskModel? taskModel,
    List<TaskModel>? waitingTaskList,
    List<TaskModel>? completedTaskList,
    LoadingStatus? loadingStatus,
    int? selectedIndex,
  }) {
    return TasksState(
        taskModel: taskModel ?? this.taskModel,
        waitingTaskList: waitingTaskList ?? this.waitingTaskList,
        completedTaskList: completedTaskList ?? this.completedTaskList,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        );
  }
}
