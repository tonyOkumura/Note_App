import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String color;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
  });
}
