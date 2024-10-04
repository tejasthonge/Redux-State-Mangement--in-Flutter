import 'dart:convert';

class Hair {
  final String color;
  final String type;
  Hair({
    required this.color,
    required this.type,
  });

  Hair copyWith({
    String? color,
    String? type,
  }) {
    return Hair(
      color: color ?? this.color,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'type': type,
    };
  }

  factory Hair.fromMap(Map<String, dynamic> map) {
    return Hair(
      color: map['color'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hair.fromJson(String source) => Hair.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Hair(color: $color, type: $type)';

  @override
  bool operator ==(covariant Hair other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.type == type;
  }

  @override
  int get hashCode => color.hashCode ^ type.hashCode;
}