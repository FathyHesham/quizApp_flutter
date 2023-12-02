import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Summary extends StatelessWidget {
  Summary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (e) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      minRadius: 35,
                      backgroundColor: e['user_answer'] == e['correct_answer']
                          ? Colors.green
                          : Colors.red,
                      child: Text(
                        ((e['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['questions'].toString(),
                            style: GoogleFonts.aBeeZee(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Correct Answer : ${e['correct_answer'].toString()}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 60, 109),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your Answer : ${e['user_answer'].toString()}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
