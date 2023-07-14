// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/src/data/note_data.dart';

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
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            autoClose: true,
            onPressed: (context) {
              print("Edit note number : ${note.id}");
              // TODO Edit note
            },
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
            backgroundColor: Colors.green,
            icon: Icons.edit,
          ),
          SlidableAction(
            autoClose: true,
            padding: EdgeInsets.zero,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16)),
            onPressed: (context) {
              print("Delete note Number: ${note.id}");
              // TODO delete note
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Card(
          color: getRandomBackgroundColor(),
          child: ListTile(
            title: Text(note.title,
                style: TextStyle(color: Colors.black, fontSize: 20)),
            subtitle: Text(note.content, style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
