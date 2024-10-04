

import 'dart:developer';

import 'Enployee_model.dart';
import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Employee_list.g.dart';


@JsonSerializable()
class EmployeeList { 
  List<EmployeeModel> list= [];
  EmployeeList({
    this.list = const []
  });

  factory EmployeeList.formJson(json)=> _$EmployeeListFromJson(json);
  Map<String ,dynamic> toJson()=> _$EmployeeListToJson(this);

  
}


class EmployeeListResponse{ 
  EmployeeList? list ;
  EmployeeListResponse(this.list );
  EmployeeListResponse.formJson(Map<String ,dynamic> json){
    log("");
    log(json.length.toString());
    list = EmployeeList.formJson(json);
  log(list!.list.length.toString());
  }
}