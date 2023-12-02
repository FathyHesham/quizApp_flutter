import 'package:flutter/material.dart';
import 'package:project1_quiz/Pages/home.page.dart';
import 'package:project1_quiz/Pages/quiz.page.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      //* create routes to pushName of the pages
      routes: {
        '/homepage': (context) => const HomePage(),
        '/quizpage': (context) => const QuizPage(),
      },
    );
  }
}
