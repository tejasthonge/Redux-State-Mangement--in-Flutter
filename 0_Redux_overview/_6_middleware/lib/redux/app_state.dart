// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:_6_middleware/redux/products/products_state.dart';


class AppState {
  final ProductsState productsState;
  AppState({
    required this.productsState,
  });

  factory AppState.initialState()=>AppState( productsState: ProductsState.initilState());

  AppState copyWith({
    ProductsState? productsState,
  }) {
    return AppState(
      productsState: productsState ?? this.productsState,
    );
  }

  @override
  String toString() => 'AppState(productsState: $productsState)';
}
