import 'dart:convert';

class Note {
  String title;
  String description;
  final String dateTime;

  Note({this.title = '', this.description = '', this.dateTime = ''});

  Map<String, dynamic> toMap() => {
    'title': title,
    'description': description,
    'dateTime': dateTime,
  };

  factory Note.fromMap(Map<String, dynamic> map) => Note(
    title: map['title'],
    description: map['description'],
    dateTime: map['dateTime'],
  );

  String toJson() => jsonEncode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(jsonDecode(source));
}
