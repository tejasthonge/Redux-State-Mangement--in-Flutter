

import 'package:_4_quiz_app/data/quizes.dart';

class ScoreState { 
  final int totleNoQuestions;
  final int noOfCorrectAnswer;

  ScoreState({required this.totleNoQuestions, required this.noOfCorrectAnswer});


  factory ScoreState.initialState(){
    return ScoreState( 
      noOfCorrectAnswer: 0,
      totleNoQuestions: questionsList.length
    );
  }

  ScoreState copyWith({int? totleNoQuestions ,int? noOfCorrectAnswer}){
    return ScoreState(
      totleNoQuestions: totleNoQuestions?? this.totleNoQuestions,
      noOfCorrectAnswer: noOfCorrectAnswer?? this.noOfCorrectAnswer,
    );
  }


  
}