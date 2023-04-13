part of '../notes_view.dart';

Widget _buildNoteGridView(NotesCubit read) {
  return read.state.loadingStatus == LoadingStatus.loading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : read.state.loadingStatus == LoadingStatus.success
          ? MasonryGridView.builder(
              itemCount: read.state.noteList?.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await context.pushRoute(AddNoteRoute(noteModel: read.state.noteList?[index] ?? NoteModel())).then(
                      (_) async {
                        await context.read<NotesCubit>().getNotes();
                      },
                    );
                  },
                  onLongPress: () {
                    DeleteItemDialog.deleteItemDialog(
                      context,
                      title: LocaleKeys.NotesView_deleteItemDialogTitle,
                      onPressed: () async {
                        context.router.pop();
                        await read.deleteItem(read.state.noteList![index].id!);
                      },
                    );
                  },
                  child: _buildNoteCard(context, read, index),
                );
              },
            )
          : read.state.loadingStatus == LoadingStatus.failure
              ? const Center(
                  child: Text("Error"),
                )
              : const SizedBox.shrink();
}

NoteCard _buildNoteCard(BuildContext context, NotesCubit read, int index) {
  return NoteCard(note: read.state.noteList![index]);
}
