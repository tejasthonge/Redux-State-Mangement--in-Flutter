


import 'dart:convert';

import 'package:_6_middleware/models/product_model.dart';
import 'package:http/http.dart' as http;

const String authority ='fakestoreapi.com';
class ProductRepository { 

  ProductRepository._(); //making private constructor to 


  //singleton pattern:  
  //ensures that only one instance of ProductRepository exists throughout the application

  static final ProductRepository _instance = ProductRepository._();

  static   ProductRepository get instance =>_instance; 

  Future<List<Product>> getPorducts()async{

    try{
      Uri url = Uri.http(authority ,'/products');
      final http.Response response = await http.get(url);
      final List jsonData = jsonDecode(response.body);
      List<Product>  products = jsonData.map((json)=>Product.fromMap(json)).toList();
      return products;
    }
    catch (e){
      rethrow;
    }

  }


  //get single product 

  Future<Product> getSingleProduct({required int id})async{

    try {
      Uri url = Uri.http(authority,'/products/$id');
      final http.Response response = await http.get(url);
      final jsonData = jsonDecode(response.body);
      final Product product = Product.fromMap(jsonData);
      return product;
    } catch (e) {
      rethrow;
    }
  }

}