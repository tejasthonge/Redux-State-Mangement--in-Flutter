import 'dart:developer';
import 'package:_5auth_api_feath/redux/employee/action.dart';
import 'package:_5auth_api_feath/redux/employee/state.dart';
import 'package:redux/redux.dart';

Reducer<EmployeeState> employeeStateReducer = combineReducers<EmployeeState>(
    [TypedReducer<EmployeeState, EmployeeListLoadded>(_loadEmployeeList)]);

EmployeeState _loadEmployeeList(
    EmployeeState empolyeeState, EmployeeListLoadded action) {
  log("load the new employee ========  =====  ====");
  return empolyeeState.copyWith(employeeList: action.employeeList);
}
