import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../provider/note_provider.dart';

Future<void> showEditNoteDialog(
  BuildContext context,
  Note note,
  int index,
) async {
  final result = await showTextInputDialog(
    context: context,
    title: 'Edit Note',
    textFields: [
      DialogTextField(initialText: note.title, hintText: 'Title'),
      DialogTextField(initialText: note.description, hintText: 'Description'),
    ],
    okLabel: 'Edit',
    cancelLabel: 'Cancel',
  );

  if (result != null && result.length == 2) {
    final updatedNote = Note(
      title: result[0],
      description: result[1],
      dateTime: note.dateTime,
    );

    // Call provider update method with index
    final provider = Provider.of<NoteProvider>(context, listen: false);

    provider.updateNote(index, updatedNote);
  }
}
