import 'dart:convert';

import 'address.dart';

class Company {
  final String department;
  final String name;
  final String title;
  final Address address;
  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address? address,
  }) {
    return Company(
      department: department ?? this.department,
      name: name ?? this.name,
      title: title ?? this.title,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'department': department,
      'name': name,
      'title': title,
      'address': address.toMap(),
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      department: map['department'] as String,
      name: map['name'] as String,
      title: map['title'] as String,
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) => Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(department: $department, name: $name, title: $title, address: $address)';
  }

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;
  
    return 
      other.department == department &&
      other.name == name &&
      other.title == title &&
      other.address == address;
  }

  @override
  int get hashCode {
    return department.hashCode ^
      name.hashCode ^
      title.hashCode ^
      address.hashCode;
  }
}