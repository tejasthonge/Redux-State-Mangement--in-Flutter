import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/employee/reducer.dart';
import 'package:_5auth_api_feath/redux/employee/state.dart';
import 'package:_5auth_api_feath/redux/loader/loader_reduser.dart';

AppState appStateReducer(AppState appState, dynamic action) => AppState(
      employeeState: employeeStateReducer(appState.employeeState, action),
      loaderState: loaderStateReducer(appState.loaderState, action));
