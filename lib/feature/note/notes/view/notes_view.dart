import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/component/note_card_component.dart';
import '../../../../product/component/search_text_field.dart';
import '../../../../product/constant/hive_constant.dart';
import '../../../../product/constant/string_constant.dart';
import '../../../../product/enum/loading_enum.dart';
import '../../../../product/extension/context_extension.dart';
import '../../../../product/manager/note_manager.dart';
import '../../../../product/mixin/delete_item_dialog.dart';
import '../../../../product/model/noteModel/note_model.dart';
import '../../../../product/navigator/app_router.dart';
import '../../../../product/widget/custom_floating_button.dart';
import '../viewModel/notes_cubit.dart';

part './subView/note_list.dart';

@RoutePage()
class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(cacheManager: NoteCacheManager(boxName: HiveConstants.noteBoxName)),
      child: SafeArea(
        child: BlocConsumer<NotesCubit, NotesState>(
          listener: (context, state) {},
          builder: (context, state) {
            var read = context.read<NotesCubit>();
            return Scaffold(
              floatingActionButton: CustomFloatingButton(
                  tag: StringConstant.instance.noteTag,
                  onPressed: () async {
                    await context.router.push(AddNoteRoute(noteModel: NoteModel())).then(
                          (_) async => await context.read<NotesCubit>().getNotes(),
                        );
                  }),
              body: _buildBody(context, read),
            );
          },
        ),
      ),
    );
  }

  Padding _buildBody(BuildContext context, NotesCubit read) {
    return Padding(
      padding: context.pagePadding,
      child: Column(
        children: [
          SearchTextField(
            controller: read.searchController,
            hintText: LocaleKeys.NotesView_searchText.locale,
            onChanged: (value) => read.searchNote(value),
          ),
          Expanded(
            child: InkWell(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: context.dynamicOnlyPadding(top: context.normalVal),
                child: _buildNoteGridView(read),
              ),
            ),
          )
        ],
      ),
    );
  }
}