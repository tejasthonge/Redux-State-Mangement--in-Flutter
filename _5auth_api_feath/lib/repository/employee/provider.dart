



import 'dart:developer';

import 'package:_5auth_api_feath/common/constants.dart';
import 'package:_5auth_api_feath/models/Employee_list.dart';
import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/repository/session/base_api_provide.dart';
import 'package:dio/dio.dart';

class EmployeeApiProvider extends BaseApiProvide{ 
  Future<EmployeeListResponse> getEmployeeList({required String page})async{

    try{
      
     Map<String ,dynamic> resonse=  await get(UrlProvider.url,queryParameters: {'page':page});
    //  log(resonse.toString());
     return EmployeeListResponse.formJson(resonse);
    }
    on DioException{
      print("-------------------------------- Employee List is not fetched--------------------------------");
      ("-------------------------------- Employee List is not fetched--------------------------------");
      rethrow;
    }

  }
}