import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:note_app/src/controllers/home_controller.dart';

final _key = GlobalKey<FormState>();

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
                  controller.addNote(
                    title: titleController.text,
                    content: contentController.text,
                  ),
                  titleController.clear(),
                  contentController.clear(),
                  Get.back()
                }
              : null;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
