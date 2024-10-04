import 'dart:convert';

import 'coordinates.dart';

class Address {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final Coordinates coordinates;
  final String country;
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) {
    return Address(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      postalCode: postalCode ?? this.postalCode,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'state': state,
      'stateCode': stateCode,
      'postalCode': postalCode,
      'coordinates': coordinates.toMap(),
      'country': country,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      stateCode: map['stateCode'] as String,
      postalCode: map['postalCode'] as String,
      coordinates: Coordinates.fromMap(map['coordinates'] as Map<String,dynamic>),
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(address: $address, city: $city, state: $state, stateCode: $stateCode, postalCode: $postalCode, coordinates: $coordinates, country: $country)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.address == address &&
      other.city == city &&
      other.state == state &&
      other.stateCode == stateCode &&
      other.postalCode == postalCode &&
      other.coordinates == coordinates &&
      other.country == country;
  }

  @override
  int get hashCode {
    return address.hashCode ^
      city.hashCode ^
      state.hashCode ^
      stateCode.hashCode ^
      postalCode.hashCode ^
      coordinates.hashCode ^
      country.hashCode;
  }
}