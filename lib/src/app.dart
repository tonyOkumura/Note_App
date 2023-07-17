import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/bindings/home_binding.dart';
import 'package:note_app/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        themeMode: ThemeMode.system,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: HomeScreen());
  }
}
