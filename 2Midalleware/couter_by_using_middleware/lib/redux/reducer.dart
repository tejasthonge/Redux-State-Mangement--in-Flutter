


//in the reducer we write the function that what type of '


import 'package:couter_by_using_middleware/redux/action.dart';

int counterReducer(int state ,dynamic action){

  if (action is IncrementAction){
    return state + 1;
  }
  return state;  //if the other action this happens then that time the value of the state is not changed 

}