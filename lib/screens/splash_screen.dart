// lib/screens/splash_screen.dart
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/provider/note_provider.dart';
import 'package:notes_keeper/widgets/colors.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      await Provider.of<NoteProvider>(context, listen: false);

      // Now go to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 50.0,
              fontFamily: 'Agne',
              color: AppColors.whiteColor,
            ),
            child: AnimatedTextKit(
              animatedTexts: [TypewriterAnimatedText('Notes Keeper')],
            ),
          ),
        ),
      ),
    );
  }
}
