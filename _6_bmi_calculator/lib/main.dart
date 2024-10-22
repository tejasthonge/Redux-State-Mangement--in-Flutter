import 'package:_6_bmi_calculator/redux/app/state.dart';
import 'package:_6_bmi_calculator/redux/store.dart';
import 'package:_6_bmi_calculator/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// import 'package:redux/redux.dart';


void main(){runApp( const MyApp() );}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  StoreProvider(store: store, child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
              inputDecorationTheme: InputDecorationTheme(
              labelStyle:const  TextStyle(color: const Color.fromARGB(255, 245, 251, 255), fontSize: 18),
              hintStyle:const TextStyle(color: const Color.fromARGB(255, 250, 233, 233)),
              prefixIconColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 243, 184, 33),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 157, 237, 160),
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 243, 175, 98),
                  width: 1.5,
                ),
              
          
          ),)),
          home: HomePage(),
        
        ));
  }
}

