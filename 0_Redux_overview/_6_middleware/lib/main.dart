
import 'package:_6_middleware/pages/product_page.dart';
import 'package:_6_middleware/pages/products_page.dart';
import 'package:_6_middleware/redux/app_middleware.dart';
import 'package:_6_middleware/redux/app_reducer.dart';
import 'package:_6_middleware/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


late final Store<AppState> store;
void main() {
  store = Store<AppState>( 
    reducer,
    initialState: AppState.initialState(),
    middleware: appMiddlewares()
  );
  runApp(MyApp(store:store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key,required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store:store,
      child: MaterialApp(
      home: Products(),
      ),
    );
  }
}
