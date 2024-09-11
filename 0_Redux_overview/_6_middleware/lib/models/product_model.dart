import 'dart:convert';

//to create this type of models use dart data class genrater extension 
//press ctr+ship+p 
//search dart data cllass geartor jsont to model
// press enter


//this is the essays way to create the models calss in dart  without type error 

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.initial()=>Product(id: 0, title: '', price: 0.0, description: '', category: '', image: '', rating: Rating.initial())  ;

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      price: map['price'].toDouble() as double,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: Rating.fromMap(map['rating'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.price == price &&
      other.description == description &&
      other.category == category &&
      other.image == image &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode ^
      rating.hashCode;
  }
}

class Rating {
  final double rate;
  final int count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.initial()=>Rating(rate: 0.0, count: 0);

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'].toDouble() as double,
      count: map['count'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rating(rate: $rate, count: $count)';

  @override
  bool operator ==(covariant Rating other) {
    if (identical(this, other)) return true;
  
    return 
      other.rate == rate &&
      other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}