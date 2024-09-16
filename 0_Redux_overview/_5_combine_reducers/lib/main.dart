



import 'package:_5_combine_reducers/pages/item_page.dart';
import 'package:_5_combine_reducers/redux/app_reduser.dart';
import 'package:_5_combine_reducers/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


late final Store<AppState> store ;
void main(){
  store = Store<AppState>( 
    reducer,
    initialState: AppState.intialState()
  );
  runApp( MyApp(store: store,));
}


class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key,required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home:const ItemPages(),
      ),
    );
  }
}