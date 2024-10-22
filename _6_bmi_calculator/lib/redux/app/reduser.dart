


import 'package:_6_bmi_calculator/redux/app/action.dart';
import 'package:_6_bmi_calculator/redux/app/state.dart';
import 'package:_6_bmi_calculator/redux/bmi/reduser.dart';
import 'package:redux/redux.dart';

// Reducer<AppState> appStateReducer = combineReducers(
//   [ 

//   ]
// );





AppState appReduser(AppState state,dynamic action)=>AppState( 
 
  bmiState: bmiReducer( 
    state.bmiState,action
  )
);