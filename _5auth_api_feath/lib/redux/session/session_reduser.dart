



import 'package:_5auth_api_feath/redux/session/session_action.dart';
import 'package:_5auth_api_feath/redux/session/session_state.dart';
import 'package:redux/redux.dart';

 Reducer<SessionState> sessionStateReduser =   combineReducers<SessionState>(
  [
    TypedReducer<SessionState,LoadSessionFromCache>(_load_session_from_cache)
  ]
);

SessionState _load_session_from_cache(SessionState sessionState ,LoadSessionFromCache action){
    return sessionState.copyWith(
      authUser: action.cached
    );
}