



import 'package:_6_bmi_calculator/redux/bmi/action.dart';
import 'package:_6_bmi_calculator/redux/bmi/state.dart';
import 'package:redux/redux.dart';


Reducer<BMIState> bmiReducer = combineReducers( 
  [ 
    TypedReducer<BMIState ,CalculateBMI>( _calculte).call,
    TypedReducer<BMIState ,BMICalculated>( _bmiCalculated).call,
  ]
);


BMIState _calculte(BMIState bmiState ,CalculateBMI  action){

  return bmiState.copyWith( 
    hightInFeet: action.heightInFeet,
    hightInInch: action.heightInInch,
    weight: action.weight
  );
}


BMIState _bmiCalculated(BMIState bmiState ,BMICalculated action){

  return bmiState.copyWith( 
    allBMI: action.bmi,
  );
}



