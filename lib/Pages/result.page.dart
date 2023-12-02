import 'package:flutter/material.dart';
import 'package:project1_quiz/Data/questions.data.dart';
import 'package:project1_quiz/Widget/summary.widget.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  ResultPage(this.selectedAnswers, {super.key});

  List<String> selectedAnswers = [];

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCorrectAnswer = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length; //? third way

    //? first way
    // for (var i = 0; i < summaryData.length; i++) {
    //   if (summaryData[i]['user_answer'] == summaryData[i]['correct_answer']) {
    //     numOfCorrectAnswer++;
    //   }
    // }
    //? second way
    // for (var element in summaryData) {
    //   if (element['user_answer'] == element['correct_answer']) {
    //     numOfCorrectAnswer++;
    //   }
    // }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Text(
                  'You answered $numOfCorrectAnswer out of ${questions.length} questions correctly!',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                Summary(summaryData),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  label: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(
                    Icons.restart_alt_sharp,
                    applyTextScaling: true,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
