import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/auth/action.dart';
import 'package:_5auth_api_feath/redux/auth/state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authStateReduser = combineReducers<AuthState>([
  TypedReducer<AuthState, LoginSuccess>(_loginSuccess),
]);

AuthState _loginSuccess(AuthState authState, LoginSuccess action) {
  return authState.copyWith(
    user: action.userInfo,
  );
}
