part of 'notes_cubit.dart';

@immutable
class NotesState extends Equatable {
  const NotesState({this.noteList, this.loadingStatus = LoadingStatus.initial});
  final List<NoteModel>? noteList;
  final LoadingStatus? loadingStatus;
  @override
  List<Object?> get props => [noteList, loadingStatus];

  NotesState copyWith({
    List<NoteModel>? noteList,
    LoadingStatus? loadingStatus,
  }) {
    return NotesState(
      noteList: noteList ?? this.noteList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
