import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:note_app/src/constants/colors.dart';

import '../models/note.dart';

class HomeController extends GetxController {
  var notes = <Note>[].obs;
  late Box<Note> _noteBox;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    _noteBox = await Hive.openBox<Note>('notes');
    notes.value = _noteBox.values.toList();
    ////
    searchController.addListener(() {
      String searchText = searchController.text;
      notes.value = _noteBox.values
          .where((note) => note.title.contains(searchText))
          .toList();
    });
  }

  void deleteNote(Note note) {
    _noteBox.delete(note.id);
    notes.remove(note);
  }

  void addNote({
    required String title,
    required String content,
  }) {
    final note = Note(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        content: content,
        color: getRandomBackgroundColor());
    _noteBox.put(note.id, note);
    notes.add(note);
  }

  void editNote(Note oldNote,
      {required String newTitle, required String newContent}) {
    final Note updatedNote = Note(
      id: oldNote.id,
      title: newTitle,
      content: newContent,
      color: oldNote.color,
    );

    _noteBox.put(oldNote.id, updatedNote);

    int oldNoteIndex = notes.indexOf(oldNote);
    notes[oldNoteIndex] = updatedNote;
  }
}
