import 'package:flutter/material.dart';
import 'package:notes_keeper/screens/add_note_screen.dart';
import 'package:notes_keeper/screens/note_details.dart';
import 'package:notes_keeper/widgets/colors.dart';
import 'package:provider/provider.dart';
import '../provider/note_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<NoteProvider>(context, listen: true);
    final notes = todoProvider.notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes Keeper',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: notes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  color: AppColors.greyColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetails(noteIndex: index),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        note.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greyColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.greyColor,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return AddNoteScreen();
            },
          );
        },
        child: const Icon(Icons.add, color: AppColors.whiteColor),
      ),
    );
  }
}
