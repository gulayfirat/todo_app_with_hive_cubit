import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_cache_manager.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../../product/enum/loading_enum.dart';
import '../../../../product/model/noteModel/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  ICacheManager<NoteModel> cacheManager;
  NotesCubit({required this.cacheManager}) : super(const NotesState()) {
    Future.microtask(() async {
      await cacheManager.init();
      getNotes();
    });
  }
  TextEditingController searchController = TextEditingController();
  Future<void> getNotes() async {
    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      List<NoteModel> notes = await cacheManager.getItems() ?? [];
      notes.sort((b, a) => a.updateDate!.compareTo(b.updateDate!));
      emit(state.copyWith(noteList: notes, loadingStatus: LoadingStatus.success));
    } on Exception catch (e) {
      log(e.toString());
      emit(state.copyWith(loadingStatus: LoadingStatus.failure));
    }
  }

  void searchNote(String query) {
    if (query.isNotEmpty) {
      List<NoteModel> noteList =
          state.noteList?.where((element) => element.note?.toLowerCase().contains(query.toLowerCase()) ?? false).toList() ?? [];
      emit(state.copyWith(noteList: noteList));
    } else {
      getNotes();
    }
  }

  void changeTheme(BuildContext context) {
    context.read<ThemeNotifier>().changeTheme();
  }
  Future<void> deleteItem(String id) async {
    await cacheManager.removeItem(id).then((value) => getNotes());
  }
}
