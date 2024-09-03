

import 'package:_3_bunch_of_action/actions.dart';
import 'package:flutter/material.dart';

class AppState{ 

  final Color selectedColor;
  final String userName;
  final bool flag;
  final List<String> items;
  final int intValue;



  AppState( 
    { 
      required this.selectedColor,
       this.userName ='',
       this.flag =false,
       this.items =const[],
       this.intValue = 0,
    }
  );

  AppState copyWith( //this method return the object ot the AppState class where we passed value repaced by it and remane set as it is 
    { 
      Color? selectedColor,
      String? userName,
      bool? flag,
      List<String>? items,
      int? intValue,
    }
  ){  
    return AppState( 
      selectedColor: selectedColor ?? this.selectedColor,
      userName: userName?? this.userName,
      flag: flag?? this.flag,
      items: items?? this.items,
      intValue: intValue?? this.intValue,
    );
  }

}


AppState appReducer(AppState state ,dynamic action){
  if (action is ColorsChangedAction){
    return state.copyWith( 
      selectedColor:
      state.selectedColor ==Colors.red?
       Colors.green:
       Colors.red

    );
  }
  else if( action is SetUserNameAction){
    return state.copyWith( 
      userName: action.name
    );
  }
  else if(action is ToggleFalgAction){
    return state.copyWith( 
      flag: !state.flag
    );
  }
  else if(action is AddIemAction){
    return state.copyWith( 
      items: state.items..add(action.item)
    );
  }
  else if(action is RemoveItemAction){
    return state.copyWith( 
      items: state.items..remove(action.item)
    );
  }
  else if( 
    action is SetIntVlueAction
  ){
    return state.copyWith( 
      intValue: action.value
    );
    
  }
  return state;
  
}
