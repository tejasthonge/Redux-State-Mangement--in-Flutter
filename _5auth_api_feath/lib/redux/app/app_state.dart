
import 'package:_5auth_api_feath/redux/employee/state.dart';
import 'package:_5auth_api_feath/redux/loader/loader_state.dart';

class AppState { 

  final LoaderState loaderState;
  final EmployeeState employeeState;

  AppState({  
    required this.loaderState,
    required this.employeeState
  });

  factory AppState.initialState()=>AppState(
    employeeState: EmployeeState.initialState(),
    loaderState: LoaderState.initialState()
  );
  

  AppState copyWith(
    { 
    EmployeeState? employeeState,
    LoaderState? loaderState,

    }
  )=>AppState( 
    employeeState : employeeState ?? this.employeeState,
    loaderState : loaderState?? this.loaderState,
  );

}