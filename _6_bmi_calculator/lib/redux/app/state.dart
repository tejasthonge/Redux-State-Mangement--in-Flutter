


import 'package:_6_bmi_calculator/redux/bmi/state.dart';

class AppState { 


  BMIState bmiState;


  AppState({

    required this.bmiState,
  });

  factory AppState.initialeState()=>AppState( 

    bmiState: BMIState.initialeState()
  );

  AppState copyWith(
    { 
    
      BMIState? bmiState
    }
  )=>AppState( 

    bmiState: bmiState?? this.bmiState,
  );

  @override
  String toString() {
    return 'AppState{ bmiState: $bmiState}';
  }
  
}