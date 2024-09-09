
import 'package:_3_store_connector_by_using_view_model/redux/state/state.dart';
import 'package:_3_store_connector_by_using_view_model/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main(){

  runApp(MyApp(store: store,));
}


 class MyApp extends StatelessWidget {
  final Store<CountterState> store;
  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
    );
  }
}