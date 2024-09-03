import 'dart:developer';

import 'package:redux/redux.dart';

void crashReportingMiddleware(Store store,dynamic action ,NextDispatcher next){

  try{

    next(action);
  }
   catch(error){  
    log("Error occurred $error ");

   }  
}