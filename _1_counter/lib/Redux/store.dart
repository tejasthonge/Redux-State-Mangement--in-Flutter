


import 'package:_1_counter/Redux/reducer/counter_reduser.dart';
import 'package:_1_counter/Redux/state/app_state.dart';
import 'package:redux/redux.dart';

final store = Store<AppState>(
  counterReducer,
  initialState: AppState.initialState()); 

  