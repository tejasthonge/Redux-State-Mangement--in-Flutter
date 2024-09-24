

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


//role of middleware is before aclling to the reduser what actually logic is happeng that is depends on middleware theis is in the asynchronus sinario time 
//like above

//by using the the middleware we can modify the action and dispatch (change the state) respective of that
//ex : above is the  best example the main action is dispatched is getproducts action but by middleware anathore action is send to the reduser by using the next
//-->why its used in async:
//  -- some time we call the api but getted the error  but widget are not knowing and it will display some data which is not present in the model to 
// -- avide this type we are using the middleware 
//the main role of middleware is if any anction is preformed then curssoning action aslso we have to profome 
//means form 