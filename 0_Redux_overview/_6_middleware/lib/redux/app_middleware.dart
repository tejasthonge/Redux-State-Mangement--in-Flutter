

import 'package:_6_middleware/redux/app_state.dart';
import 'package:_6_middleware/redux/products/products_middleware.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appMiddlewares (){
  return [ 
    productsMiddleware
  ];
}