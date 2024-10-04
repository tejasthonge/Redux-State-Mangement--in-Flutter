import 'dart:convert';

class Coordinates {
  final double lat;
  final double lng;
  Coordinates({
    required this.lat,
    required this.lng,
  });

  Coordinates copyWith({
    double? lat,
    double? lng,
  }) {
    return Coordinates(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      lat: map['lat'].toDouble() as double,
      lng: map['lng'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) => Coordinates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coordinates(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Coordinates other) {
    if (identical(this, other)) return true;
  
    return 
      other.lat == lat &&
      other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}