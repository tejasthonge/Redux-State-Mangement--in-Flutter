


import 'package:_4_quiz_app/data/quizes.dart';
import 'package:_4_quiz_app/store/ansswer/actions.dart';
import 'package:_4_quiz_app/store/ansswer/sellected_ansswer_state.dart';
import 'package:_4_quiz_app/store/app/app_state.dart';
import 'package:_4_quiz_app/store/questions/question_state.dart';
import 'package:_4_quiz_app/store/questions/qutions_action.dart';

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
  
  
  return state;
} 