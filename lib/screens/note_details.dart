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
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  'Delete',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            note.title,
            style: TextStyle(
              fontSize: 40,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.start,
            note.description,
            style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
