


import 'package:_1_counter/Redux/actions/dicreement_action.dart';
import 'package:_1_counter/Redux/actions/increement_action.dart';
import 'package:_1_counter/Redux/state/app_state.dart';

AppState counterReducer( AppState state ,dynamic acction){

  if(acction is IncrrementAction){
  
    return AppState(counter: state.counter+1);
  }
  else if( acction is DecrementAction){
    return AppState(counter: state.counter-1);
  }
  else{ 
    return state;
  }
}