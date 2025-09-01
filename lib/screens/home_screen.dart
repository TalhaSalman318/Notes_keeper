import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_keeper/screens/add_note_screen.dart';
import 'package:notes_keeper/screens/note_details.dart';
import 'package:notes_keeper/widgets/colors.dart';
import 'package:provider/provider.dart';
import '../provider/note_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<NoteProvider>(context);
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
      body: notes.isEmpty
          ? const Center(
              child: Text("No notes yet.", style: TextStyle(fontSize: 30)),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: notes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Card(
                        color: AppColors.darkGreyColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NoteDetails(noteIndex: index),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  note.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  note.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.lightGreyColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.lightGreyColor,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return AddNoteScreen();
            },
          );
        },
        child: const Icon(Icons.add, color: AppColors.blackColor),
      ),
    );
  }
}
