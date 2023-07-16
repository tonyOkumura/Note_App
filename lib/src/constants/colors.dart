import 'dart:math';

import 'package:flutter/material.dart';

String getRandomBackgroundColor() {
  return backgroundColors[Random().nextInt(backgroundColors.length)];
}

List<String> backgroundColors = [
  "FFCCE5FF", // light blue
  "FFD7F9E9", // pale green
  "FFFFF8E1", // pale yellow
  "FFF5E6CC", // beige
  "FFFFD6D6", // light pink
  "FFE5E5E5", // light grey
  "FFFFF0F0", // pale pink
  "FFE6F9FF", // pale blue
  "FFD4EDDA", // mint green
  "FFFFF3CD", // pale orange
];
