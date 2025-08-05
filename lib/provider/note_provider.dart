import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(int index, Note updateNote) {
    _notes[index] = updateNote;
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  // Splash screen
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initializeApp() async {
    await Future.delayed(Duration(seconds: 2));
    _isInitialized = true;
    notifyListeners();
  }
}
