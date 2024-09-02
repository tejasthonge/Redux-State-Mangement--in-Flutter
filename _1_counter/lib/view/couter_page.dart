

import 'package:_1_counter/Redux/actions/dicreement_action.dart';
import 'package:_1_counter/Redux/actions/increement_action.dart';
import 'package:_1_counter/Redux/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final count = AppState.initialState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.blue,
        title: Text("counter app ,redux state mangement "),
      ),
      body: Center( 
        child: StoreConnector<AppState,int>(  //this is an store connector as simelar as consumer 
          converter: (store) => store.state.counter,
          builder: (context,counter) {
            return Text( 
              counter.toString()
            );
          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
                    FloatingActionButton( 
            onPressed: (){ 
              StoreProvider.of<AppState>(context).dispatch(DecrementAction());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton( 
            onPressed: (){ 
              StoreProvider.of<AppState>(context).dispatch(IncrrementAction());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}