 

 import 'package:_5auth_api_feath/redux/app/app_reduser.dart';
import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> store = Store<AppState>( 
  appStateReducer,
  initialState: AppState.initialState(),
  middleware: [ 
    thunkMiddleware
  ]
);