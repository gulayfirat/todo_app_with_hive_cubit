import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/home/view/home_view.dart';
import '../../feature/note/addNote/view/add_note_view.dart';
import '../../feature/note/notes/view/notes_view.dart';
import '../../feature/settings/view/settings_view.dart';
import '../../feature/splash/view/splash_view.dart';
import '../../feature/tasks/view/tasks_view.dart';
import '../model/noteModel/note_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
      type: const MaterialRouteType(),
    ),
    AutoRoute(page: HomeRoute.page, path: "/", children: [
      RedirectRoute(path: '', redirectTo: 'notesFullRoute'),
      AutoRoute(
        page: EmptyNotesRoute.page,
        path: 'notesFullRoute',
        children: [
          AutoRoute(page: NotesRoute.page, path: ''),
          AutoRoute(page: AddNoteRoute.page, path: 'addNotes'),
        ],
      ),
      AutoRoute(page: TasksRoute.page, path: ''),
    ]),
    AutoRoute(page: SettingsRoute.page, path: '/'),
  ];
}

@RoutePage()
class EmptyTaskView extends AutoRouter {
  const EmptyTaskView({super.key});
}

@RoutePage()
class EmptyNotesView extends AutoRouter {
  const EmptyNotesView({super.key});
}
