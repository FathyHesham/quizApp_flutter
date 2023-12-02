import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.8, // opacity >= 0.0 && opacity <= 1.0
              child: Image.asset(
                'asses/images/quiz-logo.png',
                height: 200,
                // color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 70),
            const Text(
              'Learn Flutter',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 35),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.white70,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/quizpage');
              },
              icon: const Icon(Icons.arrow_circle_right_sharp),
              label: const Text(
                'Start Quiz',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
