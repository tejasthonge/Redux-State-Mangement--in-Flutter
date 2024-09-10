import 'package:_4_quiz_app/data/quizes.dart';

class QuestionState {
  String question;
  List<String> options;
  int carrectAnsIndex;
  int currentQutionIndex;

  QuestionState({
    required this.currentQutionIndex,
    required this.question,
    required this.options,
    required this.carrectAnsIndex,
  });

  factory QuestionState.initialState() => QuestionState(
      currentQutionIndex: 0,
      question: questionsList[0],
      options: optionsList[0],
      carrectAnsIndex: correctAnswerIndexList[0]);
}
