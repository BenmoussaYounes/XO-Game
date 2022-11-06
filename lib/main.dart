import 'package:flutter/material.dart';
import 'package:tictac/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent.shade700,
        shadowColor: Colors.indigo[900],
        splashColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: const home_screen(),
    );
  }
}
