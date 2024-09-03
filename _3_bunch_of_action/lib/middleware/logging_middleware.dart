import 'package:_3_bunch_of_action/reducers.dart';
import 'package:redux/redux.dart';

void loggingMiddleware(Store<AppState> store ,dynamic action ,NextDispatcher next){

  print("Dispathing adtion : $action");
  print("previous state :${store.state}");

  next(action);
  print("next state :${store.state}");
}