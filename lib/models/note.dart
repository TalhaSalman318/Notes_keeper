import 'dart:convert';

class Note {
  String title;
  String description;

  Note({this.title = '', this.description = ''});

  Map<String, dynamic> toMap() => {'title': title, 'description': description};

  factory Note.fromMap(Map<String, dynamic> map) =>
      Note(title: map['title'], description: map['description']);

  String toJson() => jsonEncode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(jsonDecode(source));
}
