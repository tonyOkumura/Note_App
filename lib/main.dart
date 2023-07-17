import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:note_app/src/app.dart';

import 'src/models/note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NoteAdapter());
  runApp(const MyApp());
}
