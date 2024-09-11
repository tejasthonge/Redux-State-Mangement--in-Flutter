

import 'package:_6_middleware/models/product_model.dart';
import 'package:_6_middleware/redux/app_state.dart';
import 'package:_6_middleware/redux/products/products_action.dart';
import 'package:_6_middleware/repositories/product_repository.dart';
import 'package:redux/redux.dart';

void productsMiddleware(Store<AppState> store ,dynamic action ,NextDispatcher next){
  if(action is GetProductsAction){
    ProductRepository.instance.getPorducts().then((List<Product> product){ 
      store.dispatch(GetProductSucceedAction(product: product));
    }).catchError( 
      (error)=>store.dispatch(GetProductFailedAction(error: error.toString()))
    );
  }
  next(action);
}