import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/controllers/home_controller.dart';

class AddScreen extends GetView<HomeController> {
  AddScreen({super.key});
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintText: "The Title of your note",
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
          controller.addNote(
            title: titleController.text,
            content: contentController.text,
          );
          Get.back();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
