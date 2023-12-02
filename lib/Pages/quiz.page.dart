import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1_quiz/Data/questions.data.dart';
import 'package:project1_quiz/Pages/result.page.dart';
import 'package:project1_quiz/Widget/button_answer.widget.dart';
import 'package:project1_quiz/Widget/custom_appBar.widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;

  List<String> selectAnswer = [];

  void chooseAnswer(String answer) {
    // if (kDebugMode) {
    //   print('------------------------ $answer --------------------------');
    // }
    selectAnswer.add(answer);

    if (selectAnswer.length == questions.length) {
      setState(() {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResultPage(selectAnswer)));
      });
      // selectAnswer = [];
    }

    // if (kDebugMode) {
    //   print('$selectAnswer');
    // }
  }

  void answerQuestion(String answer) {
    setState(() {
      chooseAnswer(answer);
      // currentQuestionIndex = currentQuestionIndex + 1;
      // currentQuestionIndex += 1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lora(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                //* ... => [ [1, 2, 3] , 4 ] => [ 1, 2, 3, 4 ]
                ...currentQuestion.shuffledAnswers.map(
                  (value) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      child: ButtonAnswer(
                        answerText: value,
                        onPressed: () => answerQuestion(value),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
