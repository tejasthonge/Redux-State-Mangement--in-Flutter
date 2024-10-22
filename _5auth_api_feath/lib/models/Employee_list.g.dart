// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeList _$EmployeeListFromJson(Map<String, dynamic> json) => EmployeeList(
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => EmployeeModel.fromJson(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EmployeeListToJson(EmployeeList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
