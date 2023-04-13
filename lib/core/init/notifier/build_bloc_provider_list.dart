import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'package:todo_application/feature/home/viewModel/home_cubit.dart';
import 'package:todo_application/feature/settings/viewModel/settings_cubit.dart';
import 'package:todo_application/feature/splash/viewModel/splash_cubit.dart';
import 'package:todo_application/feature/tasks/viewModel/tasks_cubit.dart';
import 'package:todo_application/product/constant/hive_constant.dart';
import 'package:todo_application/product/manager/task_manager.dart';

import '../../../feature/note/addNote/viewModel/add_note_cubit.dart';
import '../../../feature/note/notes/viewModel/notes_cubit.dart';
import '../../../product/manager/note_manager.dart';

class ApplicationBlocProvider {
  ApplicationBlocProvider._init();
  static ApplicationBlocProvider? _instance;
  static ApplicationBlocProvider get instance {
    _instance ??= ApplicationBlocProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> providers = [
    BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
    BlocProvider<NotesCubit>(create: (_) => NotesCubit(cacheManager: NoteCacheManager(boxName: HiveConstants.noteBoxName))),
    BlocProvider<AddNoteCubit>(create: (_) => AddNoteCubit(cacheManager: NoteCacheManager(boxName: HiveConstants.noteBoxName))),
    BlocProvider<TasksCubit>(create: (_) => TasksCubit(cacheManager: TaskCacheManager(boxName: HiveConstants.taskBoxName))),
    BlocProvider<SplashCubit>(create: (_) => SplashCubit()),
    BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
  ];
}
