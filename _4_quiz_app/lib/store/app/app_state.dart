

import 'package:_4_quiz_app/store/ansswer/sellected_ansswer_state.dart';
import 'package:_4_quiz_app/store/questions/question_state.dart';
import 'package:_4_quiz_app/store/score/score_state.dart';

class AppState { 

  final QuestionState questionState;
  final SellectedAnsswerState sellectedAnsswerState;
  final ScoreState scoreState;
  
  AppState({required this.scoreState, required this.questionState, required this.sellectedAnsswerState});

  factory AppState.initialState()=> AppState(questionState:QuestionState.initialState() , sellectedAnsswerState:SellectedAnsswerState.initialState(),scoreState: ScoreState.initialState());

  AppState copyWith({QuestionState? questionState, SellectedAnsswerState? sellectedAnsswerState ,ScoreState? scoreState}) {
    return AppState(questionState: questionState?? this.questionState, sellectedAnsswerState: sellectedAnsswerState?? this.sellectedAnsswerState ,scoreState: scoreState?? this.scoreState);
  }

}