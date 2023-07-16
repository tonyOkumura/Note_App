import 'package:get/get.dart';
import 'package:note_app/src/models/note.dart';

import '../data/note_data.dart';

class HomeController extends GetxController {
  List<Note> notes = NoteData().sampleNotes.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void deleteNote(Note note) {
    notes.remove(note);
    update();
  }

  void addNote({
    required String title,
    required String content,
  }) {
    notes.add(Note(title: title, content: content, id: notes.length));
  }
}
