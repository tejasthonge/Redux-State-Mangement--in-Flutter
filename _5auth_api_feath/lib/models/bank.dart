import 'dart:convert';

class Bank {
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) {
    return Bank(
      cardExpire: cardExpire ?? this.cardExpire,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      currency: currency ?? this.currency,
      iban: iban ?? this.iban,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardExpire': cardExpire,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'currency': currency,
      'iban': iban,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      cardExpire: map['cardExpire'] as String,
      cardNumber: map['cardNumber'] as String,
      cardType: map['cardType'] as String,
      currency: map['currency'] as String,
      iban: map['iban'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bank(cardExpire: $cardExpire, cardNumber: $cardNumber, cardType: $cardType, currency: $currency, iban: $iban)';
  }

  @override
  bool operator ==(covariant Bank other) {
    if (identical(this, other)) return true;
  
    return 
      other.cardExpire == cardExpire &&
      other.cardNumber == cardNumber &&
      other.cardType == cardType &&
      other.currency == currency &&
      other.iban == iban;
  }

  @override
  int get hashCode {
    return cardExpire.hashCode ^
      cardNumber.hashCode ^
      cardType.hashCode ^
      currency.hashCode ^
      iban.hashCode;
  }
}