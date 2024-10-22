


import 'package:_6_bmi_calculator/redux/app/reduser.dart';
import 'package:_6_bmi_calculator/redux/app/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> store = Store(appReduser, initialState: AppState.initialeState(),middleware: [thunkMiddleware]);