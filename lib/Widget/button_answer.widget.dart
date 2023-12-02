import 'package:flutter/material.dart';

class ButtonAnswer extends StatelessWidget {
  final String answerText;
  final void Function() onPressed;

  const ButtonAnswer({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 62, 34, 112),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
