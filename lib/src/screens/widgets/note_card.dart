// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:note_app/src/models/note.dart';

import '../../constants/colors.dart';

class NoteCard extends StatelessWidget {
  Note note;
  NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: Card(
        color: getRandomBackgroundColor(),
        child: ListTile(
          title: Text(note.title, style: TextStyle(color: Colors.black)),
          subtitle: Text(note.content, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
