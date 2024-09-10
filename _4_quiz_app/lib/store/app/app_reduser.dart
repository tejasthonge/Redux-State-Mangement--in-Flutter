


import 'package:_4_quiz_app/data/quizes.dart';
import 'package:_4_quiz_app/store/ansswer/actions.dart';
import 'package:_4_quiz_app/store/ansswer/sellected_ansswer_state.dart';
import 'package:_4_quiz_app/store/app/app_state.dart';
import 'package:_4_quiz_app/store/questions/question_state.dart';
import 'package:_4_quiz_app/store/questions/qutions_action.dart';
import 'package:_4_quiz_app/store/score/score_actions.dart';
import 'package:_4_quiz_app/store/score/score_state.dart';
import 'package:flutter/material.dart';

AppState appReducer(AppState state ,dynamic action){

  if(action is SellectOtionAction){
    return state.copyWith(sellectedAnsswerState: SellectedAnsswerState(sellctedAnsswerIndex: action.sellectedAnsIndex));
  }
  else if(action is NextQutionAction){
    return state.copyWith( 
      questionState: QuestionState(currentQutionIndex: action.nextQutionIndex, question: questionsList[action.nextQutionIndex], options: optionsList[action.nextQutionIndex], carrectAnsIndex:correctAnswerIndexList[action.nextQutionIndex] )
    );
  }
  else if(action is RefreshSellectedOptionIndexAction){
    return state.copyWith(sellectedAnsswerState: SellectedAnsswerState(sellctedAnsswerIndex: -1));
  }
  else if(action is AddScoreAction){
    int newScore = state.scoreState.noOfCorrectAnswer; ;
    if(state.questionState.carrectAnsIndex == action.sellectedAnsIndex){
      newScore++;
    }
    return state.copyWith( 
      scoreState:state.scoreState.copyWith(noOfCorrectAnswer: newScore),
    );
  }
  else if(action is RefreashQutionIndex){
    return AppState.initialState();
  }

  
  return state;
} 