// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:note_app/Class/notes.dart';

class NoteEditor extends StatelessWidget {
  final String title;
  final String content;
  final DateTime date;
  const NoteEditor({
    super.key,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController contentController =
        TextEditingController(text: content);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppBar(
            /* iconTheme: const IconThemeData(
              size: 30,
            ), */
            leading: IconButton(
              hoverColor: Colors.transparent,
              icon: Icon(
                MdiIcons.arrowULeftTop,
                color: const Color(0xFF803D3B),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                hoverColor: Colors.transparent,
                icon: Icon(
                  MdiIcons.contentSaveCheck,
                  color: const Color(0xFF803D3B),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    Note(
                      title: titleController.text,
                      content: contentController.text,
                      date: DateTime.now(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                labelText: 'Titre',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Indiquez votre titre ici',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFAF8260), width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF803D3B), width: 0.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: contentController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  labelText: 'Contenu',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Indiquez votre contenu ici',
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFAF8260), width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF803D3B), width: 0.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
