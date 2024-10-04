

import 'dart:developer';

import 'package:_5auth_api_feath/models/Employee_list.dart';
import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/repository/employee/provider.dart';
import 'package:dio/dio.dart';

class EmployeeRepository{

  final EmployeeApiProvider _apiProvider;
  EmployeeRepository(this._apiProvider);

  Future<EmployeeListResponse> getEmployeeList(String page)async{

    try{
   final empRes =   await _apiProvider.getEmployeeList(page: page);
      // log("--------------------------------  in EmployeeRepository ,getEmployeeList : ${empRes.list!.list.last}");
   
    return await _apiProvider.getEmployeeList(page: page);
    }
    on DioException catch (e)  {
      log(e.message!);
      rethrow;
    }

  }

}