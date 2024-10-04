import 'dart:convert';

import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'crypto.dart';
import 'hair.dart';

class EmployeeModel {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final Hair hair;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;
  final Crypto crypto;
  final String role;
  EmployeeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  EmployeeModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? bloodGroup,
    double? height,
    double? weight,
    String? eyeColor,
    Hair? hair,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      maidenName: maidenName ?? this.maidenName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      image: image ?? this.image,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      eyeColor: eyeColor ?? this.eyeColor,
      hair: hair ?? this.hair,
      ip: ip ?? this.ip,
      address: address ?? this.address,
      macAddress: macAddress ?? this.macAddress,
      university: university ?? this.university,
      bank: bank ?? this.bank,
      company: company ?? this.company,
      ein: ein ?? this.ein,
      ssn: ssn ?? this.ssn,
      userAgent: userAgent ?? this.userAgent,
      crypto: crypto ?? this.crypto,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'birthDate': birthDate,
      'image': image,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'hair': hair.toMap(),
      'ip': ip,
      'address': address.toMap(),
      'macAddress': macAddress,
      'university': university,
      'bank': bank.toMap(),
      'company': company.toMap(),
      'ein': ein,
      'ssn': ssn,
      'userAgent': userAgent,
      'crypto': crypto.toMap(),
      'role': role,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'].toInt() as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      maidenName: map['maidenName'] as String,
      age: map['age'].toInt() as int,
      gender: map['gender'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      birthDate: map['birthDate'] as String,
      image: map['image'] as String,
      bloodGroup: map['bloodGroup'] as String,
      height: map['height'].toDouble() as double,
      weight: map['weight'].toDouble() as double,
      eyeColor: map['eyeColor'] as String,
      hair: Hair.fromMap(map['hair'] as Map<String,dynamic>),
      ip: map['ip'] as String,
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
      macAddress: map['macAddress'] as String,
      university: map['university'] as String,
      bank: Bank.fromMap(map['bank'] as Map<String,dynamic>),
      company: Company.fromMap(map['company'] as Map<String,dynamic>),
      ein: map['ein'] as String,
      ssn: map['ssn'] as String,
      userAgent: map['userAgent'] as String,
      crypto: Crypto.fromMap(map['crypto'] as Map<String,dynamic>),
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) => EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeModel(id: $id, firstName: $firstName, lastName: $lastName, maidenName: $maidenName, age: $age, gender: $gender, email: $email, phone: $phone, username: $username, password: $password, birthDate: $birthDate, image: $image, bloodGroup: $bloodGroup, height: $height, weight: $weight, eyeColor: $eyeColor, hair: $hair, ip: $ip, address: $address, macAddress: $macAddress, university: $university, bank: $bank, company: $company, ein: $ein, ssn: $ssn, userAgent: $userAgent, crypto: $crypto, role: $role)';
  }

  @override
  bool operator ==(covariant EmployeeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.maidenName == maidenName &&
      other.age == age &&
      other.gender == gender &&
      other.email == email &&
      other.phone == phone &&
      other.username == username &&
      other.password == password &&
      other.birthDate == birthDate &&
      other.image == image &&
      other.bloodGroup == bloodGroup &&
      other.height == height &&
      other.weight == weight &&
      other.eyeColor == eyeColor &&
      other.hair == hair &&
      other.ip == ip &&
      other.address == address &&
      other.macAddress == macAddress &&
      other.university == university &&
      other.bank == bank &&
      other.company == company &&
      other.ein == ein &&
      other.ssn == ssn &&
      other.userAgent == userAgent &&
      other.crypto == crypto &&
      other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      maidenName.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      username.hashCode ^
      password.hashCode ^
      birthDate.hashCode ^
      image.hashCode ^
      bloodGroup.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      eyeColor.hashCode ^
      hair.hashCode ^
      ip.hashCode ^
      address.hashCode ^
      macAddress.hashCode ^
      university.hashCode ^
      bank.hashCode ^
      company.hashCode ^
      ein.hashCode ^
      ssn.hashCode ^
      userAgent.hashCode ^
      crypto.hashCode ^
      role.hashCode;
  }
}