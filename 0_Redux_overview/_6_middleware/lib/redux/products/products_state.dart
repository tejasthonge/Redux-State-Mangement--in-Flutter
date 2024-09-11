// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:_6_middleware/models/product_model.dart';
import 'package:flutter/foundation.dart';

enum ProductStatues{  //this is aloso like state 
  initial,
  loading,
  success,
  failure,
}
  

class ProductsState {

  final ProductStatues productStatues;
  final List<Product> products;
  final String error;
  ProductsState({
    required this.productStatues,
    required this.products,
    required this.error,

  });

  factory ProductsState.initilState()=>ProductsState(productStatues: ProductStatues.initial, products: [], error: '');


  ProductsState copyWith({
    ProductStatues? productStatues,
    List<Product>? products,
    String? error,
  }) {
    return ProductsState(
      productStatues: productStatues ?? this.productStatues,
      products: products ?? this.products,
      error: error ?? this.error
    );
  }
}
