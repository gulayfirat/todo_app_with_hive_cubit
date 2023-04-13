import 'package:flutter/material.dart';

import '../constant/size_constant.dart';
import '../extension/context_extension.dart';
import '../extension/string_extension.dart';
import '../model/noteModel/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(SizeConstant.instance.noteCardHeight),
      child: Card(
        color: note.colorName?.getColors,
        shape: RoundedRectangleBorder(borderRadius: context.border10Radius),
        child: Padding(
          padding: context.normalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    note.note ?? "",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal)),
              ),
              Text(
                note.updateDate.toString().dateFormat,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
