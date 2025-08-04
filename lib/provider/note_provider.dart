import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  // 👇 Constructor: app start hote hi call hota hai
  NoteProvider() {
    loadNotes(); // 👈 This line is important!
  }

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

  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final noteList = _notes.map((n) => jsonEncode(n.toMap())).toList();
    await prefs.setStringList('notes', noteList);
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final noteList = prefs.getStringList('notes');
    if (noteList != null) {
      _notes = noteList.map((n) => Note.fromMap(jsonDecode(n))).toList();
      notifyListeners();
    }
  }
}
