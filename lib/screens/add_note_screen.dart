import 'package:flutter/material.dart';
import 'package:notes_keeper/models/note.dart';
import 'package:notes_keeper/provider/note_provider.dart';
import 'package:notes_keeper/widgets/colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();

  final now = DateTime.now();
  final formattedDate = DateFormat(
    'EEEE, dd MMM yyyy - hh:mm a',
  ).format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // Initialize controllers or any other state if needed
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            cursorColor: AppColors.whiteColor,
            style: TextStyle(color: AppColors.whiteColor),
            controller: titleController,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              print("Entered $value");
            },
            decoration: InputDecoration(
              hintText: 'Title',
              helperStyle: TextStyle(color: AppColors.whiteColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreyColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            cursorColor: AppColors.whiteColor,
            style: TextStyle(color: AppColors.whiteColor),
            controller: descriptionController,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              print("Entered $value");
            },
            decoration: InputDecoration(
              hintText: 'Description',
              helperStyle: TextStyle(color: AppColors.whiteColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGreyColor),
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
              Navigator.pop(context);
              if (titleController.text.isNotEmpty ||
                  descriptionController.text.isNotEmpty) {
                // Create Note object
                final newNote = Note(
                  title: titleController.text,
                  description: descriptionController.text,
                  dateTime: formattedDate,
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
              style: TextStyle(color: AppColors.lightGreyColor),
            ),
          ),
        ],
      ),
    );
  }
}
