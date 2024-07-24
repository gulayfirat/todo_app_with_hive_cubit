part of 'add_note_cubit.dart';

@immutable
// ignore: must_be_immutable
class AddNoteState extends Equatable {
  AddNoteState({
    this.noteModel,
    this.colorName,
  });

  NoteModel? noteModel;
  String? colorName = BackgroundNoteCardColors.instance
      .getColorName(BackgroundNoteCardColors.instance.white);
  @override
  List<Object?> get props => [noteModel, colorName];

  AddNoteState copyWith({
    NoteModel? noteModel,
    String? colorName,
  }) {
    return AddNoteState(
      noteModel: noteModel ?? this.noteModel,
      colorName: colorName ?? this.colorName,
    );
  }
}
