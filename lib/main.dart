import 'package:flutter/material.dart';
import 'package:notes_keeper/provider/note_provider.dart';
import 'package:notes_keeper/screens/home_screen.dart';
import 'package:notes_keeper/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NoteProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
