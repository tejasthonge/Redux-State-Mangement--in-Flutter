import 'dart:convert';

class Crypto {
  final String coin;
  final String wallet;
  final String network;
  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  Crypto copyWith({
    String? coin,
    String? wallet,
    String? network,
  }) {
    return Crypto(
      coin: coin ?? this.coin,
      wallet: wallet ?? this.wallet,
      network: network ?? this.network,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coin': coin,
      'wallet': wallet,
      'network': network,
    };
  }

  factory Crypto.fromMap(Map<String, dynamic> map) {
    return Crypto(
      coin: map['coin'] as String,
      wallet: map['wallet'] as String,
      network: map['network'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Crypto.fromJson(String source) => Crypto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Crypto(coin: $coin, wallet: $wallet, network: $network)';

  @override
  bool operator ==(covariant Crypto other) {
    if (identical(this, other)) return true;
  
    return 
      other.coin == coin &&
      other.wallet == wallet &&
      other.network == network;
  }

  @override
  int get hashCode => coin.hashCode ^ wallet.hashCode ^ network.hashCode;
}