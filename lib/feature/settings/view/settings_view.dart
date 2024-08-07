import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/theme/app_themes.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/extension/context_extension.dart';
import '../../../product/navigator/app_router.dart';
import '../viewModel/settings_cubit.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.SettingsView_appBarTitle.locale),
        ),
        body: const _BuildBody(),
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var read = context.read<SettingsCubit>();
        return Column(
          children: [_BuildLanguageCard(read: read), const _BuildThemeCard()],
        );
      },
    );
  }
}

class _BuildThemeCard extends StatelessWidget {
  const _BuildThemeCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.border10Radius),
      child: ListTile(
        title: Text(LocaleKeys.SettingsView_changeTheme.locale),
        trailing: IconButton(
          icon:
              context.watch<ThemeNotifier>().currentThemeEnum == AppThemes.light
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
          onPressed: () => context.read<ThemeNotifier>().changeTheme(),
        ),
      ),
    );
  }
}

class _BuildLanguageCard extends StatelessWidget {
  const _BuildLanguageCard({
    super.key,
    required this.read,
  });

  final SettingsCubit read;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.border10Radius),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        onExpansionChanged: (_) => read.getSelectedLanguage(context),
        title: Text(LocaleKeys.SettingsView_changeLanguage.locale),
        children: List.generate(
          read.languageList.length,
          (index) => RadioListTile(
            title: Text(read.languageList[index],
                style: Theme.of(context).textTheme.labelLarge),
            value: read.languageList[index],
            selected: true,
            groupValue: read.state.selectedLanguage,
            onChanged: (value) {
              read.onChangeLanguage(context, value);
              context.router.push(const HomeRoute());
            },
          ),
        ),
      ),
    );
  }
}
