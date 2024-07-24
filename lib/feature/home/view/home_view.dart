import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/navigator/app_router.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [EmptyNotesRoute(), TasksRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.tabsRouter.activeIndex,
            onTap: context.tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.book_sharp),
                  label: LocaleKeys.HomeView_noteLabel.locale),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.task_alt_outlined),
                  label: LocaleKeys.HomeView_taskLabel.locale),
            ],
          ),
        );
      },
    );
  }
}
