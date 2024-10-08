
import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/loader/loader_action.dart';
import 'package:_5auth_api_feath/repository/employee/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

abstract class EmployeeAction {
  @override
  String toString() => "$runtimeType";
}

class EmployeeListLoadded extends EmployeeAction {
  List<EmployeeModel> employeeList;
  EmployeeListLoadded({required this.employeeList});
}


ThunkAction<AppState> getEmployeeList( BuildContext context, int page, completer) {
  final cdReository = Provider.of<EmployeeRepository>(context, listen: false);

  return (Store<AppState> store) async {
    try {
      store.dispatch(LoaderLodingStart());
      final cdResponse = await cdReository.getEmployeeList(page.toString());

      if (cdResponse.list != null) {
        store.dispatch(EmployeeListLoadded(employeeList: cdResponse.list!.list));

      }


      store.dispatch(LoaderLodingFinish());
      completer.complete();
    } catch (error) {
      store.dispatch(LoaderLodingFinish());
      completer.completeError(error);
    }
  };
}
