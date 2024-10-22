




import 'dart:developer' as dev;
import 'dart:math';

import 'package:_6_bmi_calculator/redux/app/state.dart';
import 'package:_6_bmi_calculator/redux/bmi/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

abstract class BMIAction{}




class CalculateBMI extends BMIAction{
double heightInFeet;
  double heightInInch;
  double weight;

  CalculateBMI({
    required this.heightInFeet,
    required this.heightInInch,
    required this.weight,
  });
}


class BMICalculated extends BMIAction{
  double bmi;
  BMICalculated({
    required this.bmi,
  });
}

ThunkAction<AppState> bmiCalculated(
  {required double bmi}
){

  return (Store<AppState> store){
    store.dispatch(BMICalculated(bmi: bmi));
  };
}


ThunkAction<AppState > calculateBMI({
  required double heightInFeet,
  required double heightInInch,
  required double weight
}){ 
  return (Store<AppState> store){

    double totalHeight =double.parse( "${(heightInFeet*12).round()}.${heightInInch.round()}")*0.0254;
    // double totalHeight = 8.9;
    // dev.log(heightInInch.toString() + heightInFeet.toString());
    dev.log(totalHeight.toString());
    double bmi = weight/ pow( totalHeight, 2); 
    dev.log(bmi.toString());
    // store.dispatch(BMICalculated(bmi: bmi));
    store.dispatch(bmiCalculated(bmi: bmi));
  };
}



