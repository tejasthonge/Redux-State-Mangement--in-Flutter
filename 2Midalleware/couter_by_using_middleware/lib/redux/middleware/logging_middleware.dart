

import 'dart:developer';
import 'dart:io';

import 'package:redux/redux.dart';

void loggingMiddleware(Store store,dynamic action ,NextDispatcher  next){



  log("Dispathing L $action");

  log("previous state: ${store.state}");

  next(action);  //

  log("next state: ${store.state} ");

  log('----------------------------------------------------------------');
}