import 'dart:developer';
import 'package:_5auth_api_feath/models/Enployee_model.dart';

class EmployeeState {
  // final EmployeeList? employeeList;
  final List<EmployeeModel>? employeeList;
  const EmployeeState({required this.employeeList});

  factory EmployeeState.initialState() =>
      const EmployeeState(employeeList:[]);

  EmployeeState copyWith({List<EmployeeModel>? employeeList}) {
    log("Updating the state================================================================");
    return EmployeeState(employeeList: employeeList ?? this.employeeList);
  }
}
