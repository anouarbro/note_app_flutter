import 'package:flutter/material.dart';

class ArchNote extends StatelessWidget {
  const ArchNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ArchNotePage(),
      ),
    );
  }
}

class ArchNotePage extends StatefulWidget {
  const ArchNotePage({super.key});

  @override
  State<ArchNotePage> createState() => _ArchNotePageState();
}

class _ArchNotePageState extends State<ArchNotePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
