import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  Future<void> initializeApp() async {
    await loadNotes();
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedNotes = prefs.getStringList('notes');

    if (storedNotes != null) {
      _notes = storedNotes.map((e) => Note.fromJson(e)).toList();
    }

    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    _notes.add(note);
    await saveToPrefs(); // 👈 Added
    notifyListeners();
  }

  Future<void> updateNote(int index, Note updateNote) async {
    _notes[index] = updateNote;
    await saveToPrefs(); // 👈 Added
    notifyListeners();
  }

  Future<void> deleteNote(Note note) async {
    _notes.remove(note);
    await saveToPrefs(); // 👈 Added
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _notes.map((note) => note.toJson()).toList();
    await prefs.setStringList('notes', data);
  }
}
