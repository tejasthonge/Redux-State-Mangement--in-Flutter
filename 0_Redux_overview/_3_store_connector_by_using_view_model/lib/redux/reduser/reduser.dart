


import 'package:_3_store_connector_by_using_view_model/redux/actions/actions.dart';
import 'package:_3_store_connector_by_using_view_model/redux/state/state.dart';

CountterState countterReduser(CountterState state , dynamic action){

  if(action is IncrementAction){
    return state.coppyWith(counter:state.counter + action.payload);
  }
  if(action is DecrementAction){
    return state.coppyWith(counter:state.counter - action.payload);
  }
  return state;
}