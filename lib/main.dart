
// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'quiz_route.dart';


/// The function that is called when main.dart is run.
void main() => runApp(QuizTtsApp());

/// This widget is the root of our application.
class QuizTtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Text To Speech',
      home: QuizRoute(),
    );
  }




}