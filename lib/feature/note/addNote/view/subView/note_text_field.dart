part of '../add_note_view.dart';

ListView _buildNoteTextField(AddNoteCubit watch) {
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
