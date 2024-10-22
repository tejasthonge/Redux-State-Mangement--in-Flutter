


import 'package:_5auth_api_feath/models/auth_model.dart';

class SessionState {

  UserModel? authUser;

  SessionState({required this.authUser});

  factory SessionState.intialState()=>SessionState(
    authUser: null,
  );

  SessionState copyWith(
    { 
      UserModel? authUser
    }
  )=>SessionState(authUser:authUser??this.authUser );

  @override
  String toString() => "SessionState($authUser)";
}