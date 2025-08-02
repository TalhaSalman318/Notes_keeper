import 'package:flutter/material.dart';
import 'package:notes_keeper/models/note.dart';
import 'package:notes_keeper/provider/note_provider.dart';
import 'package:notes_keeper/widgets/colors.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title',
              helperStyle: TextStyle(color: AppColors.whiteColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blackColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
              helperStyle: TextStyle(color: AppColors.whiteColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blackColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor,
            ),
            onPressed: () {
              if (titleController.text.isNotEmpty ||
                  descriptionController.text.isNotEmpty) {
                // Create Note object
                final newNote = Note(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                // Add note using provider
                noteProvider.addNote(newNote);
                titleController.clear();
                descriptionController.clear();
                print("Note Added");
              }
            },
            child: Text(
              'Add Note',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
