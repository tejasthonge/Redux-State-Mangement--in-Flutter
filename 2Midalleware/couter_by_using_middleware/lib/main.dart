

import 'package:couter_by_using_middleware/redux/store.dart';
import 'package:couter_by_using_middleware/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


void main(){
  final store = createStore();
  runApp(MyApp(store: store,));
}


class MyApp extends StatelessWidget {
  final Store<int> store;
  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store:store,
      child: MaterialApp( 
        home: CounterPage(),
      ),
    );

    
  }
}