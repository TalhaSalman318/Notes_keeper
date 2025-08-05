import 'package:flutter/material.dart';
import 'package:notes_keeper/widgets/colors.dart';
import 'package:provider/provider.dart';
// import '../models/note.dart';
import '../provider/note_provider.dart';
import 'edit_note_screen.dart';

class NoteDetails extends StatelessWidget {
  final int noteIndex;
  // final Note note ;

  const NoteDetails({super.key, required this.noteIndex});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<NoteProvider>(context, listen: true);
    if (noteIndex >= todoProvider.notes.length) {
      Future.delayed(Duration.zero, () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });
      return const SizedBox.shrink();
    }

    final note = todoProvider.notes[noteIndex];

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.whiteColor, // 👈 Back arrow color
        ),
        backgroundColor: AppColors.blackColor,
        actions: [
          PopupMenuButton<String>(
            color: AppColors.greyColor,
            onSelected: (value) {
              if (value == 'edit') {
                showEditNoteDialog(context, note, noteIndex);
              } else if (value == 'delete') {
                todoProvider.deleteNote(note);
                Navigator.pop(context);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text(
                  'Edit',
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  'Delete',
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                note.title,
                style: TextStyle(
                  fontSize: 40,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                note.description,
                style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
