


import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/models/auth_model.dart';

class AuthState {
  EmployeeModel? user;
  AuthState({required this.user});
  factory AuthState.intialState()=>AuthState( user: null);
  AuthState copyWith({EmployeeModel? user}) => AuthState(
    user: user?? this.user,
  );
}