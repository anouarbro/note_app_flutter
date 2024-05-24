import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/View/introPage.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
        useMaterial3: true,
        hoverColor: const Color(0xFFD4B08A),
        focusColor: const Color(0xFF803D3B),
        splashFactory: NoSplash.splashFactory,
      ),
      title: 'Note',
      home: const IntroPage(),
    );
  }
}
