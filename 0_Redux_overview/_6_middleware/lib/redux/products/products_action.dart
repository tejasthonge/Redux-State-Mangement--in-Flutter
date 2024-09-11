// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:_6_middleware/models/product_model.dart';

class GetProductsAction{

  @override
  String toString() =>"getProductAction";
}


class GetProductSucceedAction {

  final List<Product> product;
  GetProductSucceedAction({
    required this.product,
  });

  @override
  String toString() => 'GetProductSucceedAction(product: $product)';
}


class GetProductFailedAction {

  final String error;
  GetProductFailedAction({
    required this.error,
  }); 

  @override
  String toString() => 'GetProductFailedAction(error: $error)';
}
