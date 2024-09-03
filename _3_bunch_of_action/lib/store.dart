

import 'package:_3_bunch_of_action/middleware/logging_middleware.dart';
import 'package:_3_bunch_of_action/reducers.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore(){

  return Store<AppState>(
    appReducer,//it get the object of the AppState 
    initialState: AppState(selectedColor: Colors.transparent),
    middleware: [ 
      loggingMiddleware
    ]
  );
}
