import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/base/base_cache_manager.dart';
import '../../../../product/constant/note_card_colors_constant.dart';
import '../../../../product/model/noteModel/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  BaseCacheManager<NoteModel> cacheManager;
  AddNoteCubit({required this.cacheManager}) : super(AddNoteState()) {
    Future.microtask(() async {
      await cacheManager.init();
      bindModelToData();
    });
  }

  TextEditingController noteController = TextEditingController();
  Uuid uuid = const Uuid();

  void bindModelToData() {
    noteController.text = state.noteModel?.note ?? "";
    emit(state.copyWith(
        colorName: state.noteModel?.colorName ??
            BackgroundNoteCardColors.instance
                .getColorName(BackgroundNoteCardColors.instance.white)));
  }

  void changeSelectedColor(index) {
    emit(state.copyWith(
        colorName: BackgroundNoteCardColors.instance.getColorName(
            BackgroundNoteCardColors.instance.getColorList[index])));
  }

  Future<void> addNote() async {
    NoteModel noteModel = NoteModel(
      id: state.noteModel?.id ?? uuid.v1(),
      createDate: state.noteModel?.createDate ?? DateTime.now(),
      updateDate: DateTime.now(),
      note: noteController.text,
      colorName: state.colorName,
    );
    await cacheManager.putItem(noteModel.id!, noteModel).then((_) {
      log(noteModel.toString());
    });
  }
}
