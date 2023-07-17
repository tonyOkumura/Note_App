import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/note.dart';

final _key = GlobalKey<FormState>();

class EditScreen extends GetView<HomeController> {
  EditScreen({required this.note, super.key});
  final Note note;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    contentController.text = note.content;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Form(
            key: _key,
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintText: "The Title of your note",
              ),
              validator: (value) =>
                  value!.isEmpty ? "Title can't be empty" : null,
            ),
          ),
          Divider(),
          Expanded(
            child: TextField(
              controller: contentController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintText: "The Content of your note",
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _key.currentState!.validate()
              ? {
                  controller.editNote(
                    note,
                    newTitle: titleController.text,
                    newContent: contentController.text,
                  ),
                  titleController.clear(),
                  contentController.clear(),
                  Get.back()
                }
              : null;
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
