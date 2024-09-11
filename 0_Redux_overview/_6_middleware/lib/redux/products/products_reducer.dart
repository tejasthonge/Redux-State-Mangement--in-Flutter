


import 'package:_6_middleware/redux/products/products_action.dart';
import 'package:_6_middleware/redux/products/products_state.dart';
import 'package:redux/redux.dart';

ProductsState getProductsReducer(ProductsState state ,GetProductsAction action){

  return state.copyWith( 
    productStatues: ProductStatues.loading, 
  );
}

ProductsState getProductsSuccessReducer(ProductsState state , GetProductSucceedAction action){
  return state.copyWith( 
    productStatues: ProductStatues.success, 
    products: action.product,
  );
}

ProductsState getProductsFailureReducer(ProductsState state ,GetProductFailedAction action){
  return state.copyWith( 
    productStatues: ProductStatues.failure,
    error: action.error,
  );
}


Reducer<ProductsState> productsReducer = combineReducers<ProductsState>([
    TypedReducer<ProductsState, GetProductsAction>(getProductsReducer),
    TypedReducer<ProductsState, GetProductSucceedAction>(getProductsSuccessReducer),
    TypedReducer<ProductsState, GetProductFailedAction>(getProductsFailureReducer),
  ]);