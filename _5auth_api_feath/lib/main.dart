


import 'package:_5auth_api_feath/common/http.dart';
import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/app/store.dart';
import 'package:_5auth_api_feath/repository/employee/provider.dart';
import 'package:_5auth_api_feath/repository/employee/repository.dart';
import 'package:_5auth_api_feath/view/employee_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';

void main(){ 

  WidgetsFlutterBinding.ensureInitialized();
  Http().init(store);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child:MultiProvider(
        providers: [ 
                              Provider<EmployeeRepository>.value(value: EmployeeRepository(EmployeeApiProvider()))

        ],
        child: const  MaterialApp( 
        
          home: EmployyeListPage(),
        ),
      ),
    );
  }
}