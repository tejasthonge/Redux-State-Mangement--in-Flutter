// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeList _$EmployeeListFromJson(Map<String, dynamic> json) {
  log(r"in _$EmployeeListFromJson");
  log(json.length.toString());
  return  EmployeeList(
  
      list: (json["users"] as List<dynamic>?)
              ?.map((e) => EmployeeModel.fromMap(e ))
              .toList() ??
          const [],
    );
}

Map<String, dynamic> _$EmployeeListToJson(EmployeeList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
