
import 'package:_4_quiz_app/store/app/app_reduser.dart';
import 'package:_4_quiz_app/store/app/app_state.dart';
import 'package:_4_quiz_app/ui/screens/quizes/quize_sreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';


late final Store<AppState> store;
void main(){
  store= Store<AppState>( 
    appReducer,
    initialState: AppState.initialState()
  );
  runApp(MyApp(store: store,));
}


class MyApp extends StatelessWidget{

  final Store<AppState> store;
  const MyApp({super.key ,required this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
    store:store, 
    child:MaterialApp( 
      theme: ThemeData( 
        textTheme: TextTheme( 
          bodySmall: GoogleFonts.quicksand(),
          bodyMedium: GoogleFonts.poppins(),
          bodyLarge: GoogleFonts.mukta()
        )
      ),
      home:QuizeSreen(store: store)
    ) 
    );
  }
}