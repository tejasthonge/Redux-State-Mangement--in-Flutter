
import 'package:_5auth_api_feath/redux/auth/state.dart';
import 'package:_5auth_api_feath/redux/employee/state.dart';
import 'package:_5auth_api_feath/redux/loader/loader_state.dart';
import 'package:flutter/material.dart';

class AppState {

  final LoaderState loaderState;
  final EmployeeState employeeState;
  final AuthState authState;
  AppState({  
    required this.loaderState,
    required this.employeeState,
    required this.authState
  });
  factory AppState.initialState()=>AppState(
    employeeState: EmployeeState.initialState(),
    loaderState: LoaderState.initialState(),
    authState:  AuthState.intialState()
  );
  AppState copyWith(
    { 
    EmployeeState? employeeState,
    LoaderState? loaderState,
    AuthState? authState,
    }
  )=>AppState( 
    employeeState : employeeState ?? this.employeeState,
    loaderState : loaderState?? this.loaderState,
      authState:authState ?? this.authState
  );
}

