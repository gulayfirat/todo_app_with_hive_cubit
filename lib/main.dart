import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'core/init/lang/language_manager.dart';
import 'core/init/notifier/build_bloc_provider_list.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'product/navigator/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: ApplicationProvider.instance.providers,
    child: EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: LanguageManager.instance.languagePath,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: ApplicationBlocProvider.instance.providers,
        child: MaterialApp.router(
          routerConfig: appRouter.config(),
          title: 'Todo Application',
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: context.watch<ThemeNotifier>().currentTheme,
        ));
  }
}
