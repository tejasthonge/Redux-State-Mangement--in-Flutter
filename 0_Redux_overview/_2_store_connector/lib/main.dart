
//following class is the all state conteing in the follwing class this is class if thire is no other state
// State :
//     - the state can be any value 
//         -like prmitive type :string ,int 
//         - or we defined class

//     Use class-type state whenever it possible

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CounterState{
  final int counter;  //the state is imutable the resion of the final variable 
  const CounterState({required this.counter});

  //thire is only way to chnage the counter variable 
  //by using the copywith constructor

  CounterState copyWith({int? counter}) => CounterState(counter: counter?? this.counter);



  //it is more convenient to to write the intial state inside the State  due to that it is easy to see 
  factory CounterState.initilaState(){
    return CounterState(counter: 0);
  }


  //for the debuing resion it esay to udustude the value of the couter by using the toString metod
  //this method is used for the testing purpose to create a new state with the same counter
  @override
  String toString() {
    return 'CounterState{counter: $counter}';
  }

}

//here we define an initial action as follow
// we are write 
//thire is no requrement of theis intialState the resion of the Factory constructor by using this we are 
//returning the intial state so igmore this intial state variable 
final CounterState initilaState = CounterState(counter: 0); 


//following are the actions as
//they aloso define ad class or if we do not have to pass the data to them then we are able to use enum also 

// like

/*
enum Actions{
  action1, action2, action
}
*/

//but by using the class for action it is better way


// Action:
//     action due to that it will resion state will we change
//     type +Payload
//     type:it is type of action to to describing the action are which type 
//     paylaod :it is the adition data required to peform the action 


class IncrementAction{
  final int payload;
  const IncrementAction({required this.payload});
}

class DecrementAction{
  final int payload;
  const DecrementAction({required this.payload});
}



// Reduser 

//     -it is pure function that takes two arguments
//     and computes a new state

//     this funtin take the tow arguments that is 
//         1 current state 
//         2 action 

//            depedend on 
//              that 
//               it


//             new state
//             is defined
            

CounterState counterReduser( CounterState state ,  dynamic action){

  if(action is IncrementAction ){
    return state.copyWith(counter:state.counter+ action.payload  );
  }
  else if(action is DecrementAction){
    return state.copyWith(counter: state.counter - action.payload  ); 
  }
  return state;// if the action is not above of type then we retuning as it is state as above
}

final Store<CounterState> store = Store<CounterState>(
  counterReduser,
  initialState: CounterState.initilaState(),
  // middleware: [loggerMiddleware]  //you can add any middleware you want here like thunk, saga, etc.
);


void main() {
  runApp( MyApp(store: store,));
}


class MyApp extends StatelessWidget {
  final store;
  const MyApp({super.key,required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState >(
      store: store!,
      child:  MaterialApp( 
          home: Scaffold( 
        

        //this is basically how the store connector use but we con user by using the 
        //ViewModel for the perfose of profonmance oftimization to check that seconfile of name 
            body:StoreConnector<CounterState ,CounterState>( 
              converter: (store) => store.state,
              builder: (context ,state) {
                return Center( 
                
                  child: Text( 
                  state.counter.toString()
                  )
                );
              }
            ),
            floatingActionButton: Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 FloatingActionButton(
              onPressed: () {
                store.dispatch(DecrementAction(payload: 1)); //this diapatch method is used to pass the action to the reducer and then dpednding upon cation type the action will take the paylad and handle the state anre create the  new state and redering on the screen 
              },
              child: Icon(Icons.arrow_downward,),),
              const SizedBox(width: 20,),
                FloatingActionButton(
                  onPressed: () {
                    store.dispatch(IncrementAction(payload: 1));
                  },
                  child: Icon(Icons.arrow_upward),),
              ],
            )
          ),
        )
      
    );
  }
}
