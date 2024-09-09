



import 'package:_3_store_connector_by_using_view_model/redux/actions/actions.dart';
import 'package:_3_store_connector_by_using_view_model/redux/state/state.dart';
import 'package:redux/redux.dart';

class Viewmodel { 

  final int counter; 
  final void Function(int payload) incrementCounter;
  final void Function(int payload) decrementCounter;

  Viewmodel( 
    { 
      required this.counter,
      required this.decrementCounter,
      required this.incrementCounter,
    }
  ); 

  static fromStore(Store<CountterState> store){  //this method we call at the time we passing the store to the the storeconnector paremetor that is convetor the tyme we call the static method fromStore so 
  // by using the the we can handle the nessary reduild widget and unnecessary widget will not redubild 
  //and that reasion we can increse the profomace optimization by using the storeconnector and using the view model as comper to the store builder
  
    return Viewmodel(
      counter: store.state.counter,
      incrementCounter:  (int payload)=>store.dispatch(
        IncrementAction(payload: payload)
      ),
      decrementCounter: (int payload)=>store.dispatch( 
        DecrementAction(payload: payload)
      )
    );
  }

}