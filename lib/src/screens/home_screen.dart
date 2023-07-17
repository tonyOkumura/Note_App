import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/models/note.dart';
import 'package:note_app/src/screens/add_screen.dart';

import '../controllers/home_controller.dart';
import 'widgets/note_card.dart';

// ignore: must_be_immutable
class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
        title: Text("Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: "Search notes ...",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search))),
          SizedBox(height: 8),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: ((context, index) {
                    return NoteCard(
                        note: controller
                            .notes[controller.notes.length - index - 1]);
                  })),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
