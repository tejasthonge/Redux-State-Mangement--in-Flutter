


import 'package:_1_counter/Redux/state/app_state.dart';
import 'package:_1_counter/Redux/store.dart';
import 'package:_1_counter/view/couter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main()=> runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      home: StoreProvider<AppState>(
        store: store,
        child: CounterScreen()),
    );
  }
}