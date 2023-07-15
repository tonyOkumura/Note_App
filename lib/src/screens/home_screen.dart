import 'package:flutter/material.dart';
import 'package:note_app/src/data/note_data.dart';
import 'package:note_app/src/models/note.dart';

import 'widgets/note_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Note> notes = NoteData().sampleNotes;

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
          const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: "Search notes ...",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search))),
          SizedBox(height: 8),
          Expanded(
              child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: ((context, index) {
                    return NoteCard(note: notes[index]);
                  })))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
