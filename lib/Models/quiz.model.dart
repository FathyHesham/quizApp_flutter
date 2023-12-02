// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizQuestion {
  final String text;
  final List<String> answers;
  QuizQuestion({
    required this.text,
    required this.answers,
  });

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers); // copy list of answers
    shuffledList.shuffle(); // random of this new list
    return shuffledList;
  }
}
