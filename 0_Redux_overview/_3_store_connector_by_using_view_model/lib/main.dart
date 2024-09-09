import 'package:_3_store_connector_by_using_view_model/redux/actions/actions.dart';
import 'package:_3_store_connector_by_using_view_model/redux/state/state.dart';
import 'package:_3_store_connector_by_using_view_model/redux/store.dart';
import 'package:_3_store_connector_by_using_view_model/viewmodels/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<CountterState> store;
  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountterState>(
      store: store,
      child: MaterialApp(
          home: StoreConnector<CountterState, Viewmodel>(
              converter: (store) => Viewmodel.fromStore(store),
              builder: (BuildContext context, Viewmodel vm) {
                if(vm.counter == 3){
                  WidgetsBinding.instance.addPostFrameCallback((_){
                     showDialog(
                      context: context,
                       builder: (context) {
                         return AlertDialog( 
                          content: Text(
                            '''
                        this is an alert fo how to handle some condintion 
                        it handle when counter value is : ${vm.counter}
                            '''
                          ),
                                             );
                       }
                     );
                  });
                }
                return
                 Scaffold(
                  body: Center(
                    child: Text("count : ${vm.counter}"),
                  ),
                  floatingActionButton: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          vm.incrementCounter(1);
                        },
                        child: Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      FloatingActionButton(
                        onPressed: () => vm.decrementCounter(1),
                        child: Icon(Icons.remove),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
