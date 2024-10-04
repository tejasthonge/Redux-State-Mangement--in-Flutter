import 'dart:async';
import 'dart:developer';

import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/employee/action.dart';
import 'package:_5auth_api_feath/redux/employee/state.dart';
import 'package:_5auth_api_feath/redux/loader/loader_action.dart';
import 'package:_5auth_api_feath/redux/loader/loader_state.dart';
import 'package:_5auth_api_feath/repository/employee/repository.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EmployyeListPage extends StatefulWidget {
  const EmployyeListPage({super.key});

  @override
  State<EmployyeListPage> createState() => _EmployyeListPageState();
}



class _EmployyeListPageState extends State<EmployyeListPage> {


late _ModelView viewModel;

@override
void initState() {
  super.initState();
} 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 217, 217),
        appBar: AppBar(
          backgroundColor: Colors.amber.shade200,
          title: Text("Pixel 6 Project Structure"),
        ),
        body: StoreConnector<AppState, _ModelView>(
            onInit: (store) {
              Completer completer = Completer();
              store.dispatch(getEmployeeList(context, 1, completer));
              // log("$rep");
            },
            converter: (store) => _ModelView.formStore(context, store),
            builder: (context, vm) {
            // print(vm.employeeState.employeeList[0].email);
              viewModel = vm;
              if(vm.loaderState!.isLoading){
                return Center(child: CircularProgressIndicator());
              }
              else if(vm.employeeState.employeeList != null &&
                  vm.employeeState.employeeList!.isNotEmpty) {

                return ListView.builder(
                  itemCount: vm.employeeState.employeeList!.length,
                  itemBuilder: (BuildContext context ,index ){

                    
                    final emp = vm.employeeState.employeeList![index];

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration( 
                      color: Colors.amber.shade100
                    ),
                    child: ListTile( 
                          
                          leading: CircleAvatar(
                            radius: 30,
                            child: Image.network(
                              fit: BoxFit.cover,
                              emp.image
                                                    ),
                          ),
                    
                        title: Text(emp.firstName),
                        subtitle: Text(emp.lastName),
                          trailing: Text(emp.company.department),
                    ),
                  );
                });
              } else {
                return Center(child: Text("No employee data available"));
              }
            
            }
            ));
  }
}

class _ModelView {
  final LoaderState? loaderState;
  final EmployeeState employeeState;
  final Function loadEmployeeList;

  _ModelView({required this.loaderState, required this.employeeState, required this
  .loadEmployeeList});

  static _ModelView formStore(BuildContext context, Store<AppState> store) {
    
    return _ModelView(
      employeeState: store.state.employeeState,
      loaderState: store.state.loaderState,
      loadEmployeeList: (page, completer) => store.dispatch(
          getEmployeeList(context, page, completer)),
    );
  }
}
