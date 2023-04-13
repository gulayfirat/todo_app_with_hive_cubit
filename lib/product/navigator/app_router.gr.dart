// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddNoteView(
          key: args.key,
          noteModel: args.noteModel,
        ),
      );
    },
    NotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    TasksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TasksView(),
      );
    },
    EmptyTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyTaskView(),
      );
    },
    EmptyNotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyNotesView(),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddNoteView]
class AddNoteRoute extends PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({
    Key? key,
    required NoteModel noteModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddNoteRoute.name,
          args: AddNoteRouteArgs(
            key: key,
            noteModel: noteModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const PageInfo<AddNoteRouteArgs> page =
      PageInfo<AddNoteRouteArgs>(name);
}

class AddNoteRouteArgs {
  const AddNoteRouteArgs({
    this.key,
    required this.noteModel,
  });

  final Key? key;

  final NoteModel noteModel;

  @override
  String toString() {
    return 'AddNoteRouteArgs{key: $key, noteModel: $noteModel}';
  }
}

/// generated route for
/// [NotesView]
class NotesRoute extends PageRouteInfo<void> {
  const NotesRoute({List<PageRouteInfo>? children})
      : super(
          NotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TasksView]
class TasksRoute extends PageRouteInfo<void> {
  const TasksRoute({List<PageRouteInfo>? children})
      : super(
          TasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyTaskView]
class EmptyTaskRoute extends PageRouteInfo<void> {
  const EmptyTaskRoute({List<PageRouteInfo>? children})
      : super(
          EmptyTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyNotesView]
class EmptyNotesRoute extends PageRouteInfo<void> {
  const EmptyNotesRoute({List<PageRouteInfo>? children})
      : super(
          EmptyNotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyNotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
