

import 'package:_6_middleware/redux/app_state.dart';
import 'package:_6_middleware/redux/products/products_reducer.dart';

AppState reducer(AppState state ,dynamic action){

  return AppState(productsState: productsReducer(state.productsState, action));
}

