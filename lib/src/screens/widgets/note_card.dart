// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'package:note_app/src/models/note.dart';

import '../../controllers/home_controller.dart';
import '../../constants/colors.dart';

// ignore: must_be_immutable
class NoteCard extends GetView<HomeController> {
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
            backgroundColor: Colors.green.shade500,
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
              controller.deleteNote(note);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          )
        ]),
        child: Card(
          color: Color(int.parse(note.color, radix: 16)),
          child: ListTile(
            title: Text(note.title,
                style: TextStyle(color: Colors.black, fontSize: 24)),
            subtitle: Text(note.content, style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
