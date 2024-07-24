// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/constant/hive_constant.dart';
import '../../../../product/constant/note_card_colors_constant.dart';
import '../../../../product/constant/size_constant.dart';
import '../../../../product/extension/context_extension.dart';
import '../../../../product/extension/string_extension.dart';
import '../../../../product/manager/note_manager.dart';
import '../../../../product/model/noteModel/note_model.dart';
import '../../../../product/widget/custom_text_field.dart';
import '../viewModel/add_note_cubit.dart';

part './subView/note_card_color_palette.dart';
part './subView/note_text_field.dart';

@RoutePage()
class AddNoteView extends StatefulWidget {
  final NoteModel noteModel;
  const AddNoteView({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AddNoteCubit(
            cacheManager: NoteCacheManager(boxName: HiveConstants.noteBoxName));
      },
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var read = context.read<AddNoteCubit>();
          var watch = context.watch<AddNoteCubit>();
          read.state.noteModel = widget.noteModel;
          return _buildBody(read, context, watch);
        },
      ),
    );
  }

  Scaffold _buildBody(
      AddNoteCubit read, BuildContext context, AddNoteCubit watch) {
    return Scaffold(
      backgroundColor: read.state.colorName?.getColors,
      appBar: AppBar(
        title: Text(
          widget.noteModel.id == null
              ? LocaleKeys.AddNote_appBarAddTitle.locale
              : LocaleKeys.AddNote_appBarUpdateTitle.locale,
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        actions: [_buildAddNoteButton(context)],
      ),
      body: Padding(
          padding: context.pagePadding,
          child: Column(
            children: [
              _buildColorPaletteSizedBox(context, read),
              Expanded(
                child: BuildNoteTextField(watch: watch),
              )
            ],
          )),
    );
  }

  IconButton _buildAddNoteButton(BuildContext context) {
    return IconButton(
      onPressed: () async => await context
          .read<AddNoteCubit>()
          .addNote()
          .then((_) => context.router.pop()),
      icon: const Icon(Icons.done),
    );
  }
}

// ignore: must_be_immutable
class BuildNoteTextField extends StatelessWidget {
  AddNoteCubit watch;
  BuildNoteTextField({
    Key? key,
    required this.watch,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextField(
          onChanged: (value) {},
          controller: watch.noteController,
          hintText: LocaleKeys.AddNote_hintText.locale,
          inputAction: TextInputAction.newline,
          isNote: true,
        )
      ],
    );
  }
}
