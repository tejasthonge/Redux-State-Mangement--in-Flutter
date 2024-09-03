


import 'package:_3_bunch_of_action/actions.dart';
import 'package:_3_bunch_of_action/pages/second_screen.dart';
import 'package:_3_bunch_of_action/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title:  Text("First Screen "),
      ),

      body: Center(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
        
            StoreConnector<AppState ,Color>(
            converter: (store)=>store.state.selectedColor,  //here we just storing the color not model so we just accasses the single instance of it 
            builder:(context,color){
        
              return Container( 
                height: 100,
                width: 100,
        
                decoration: BoxDecoration( 
                  color: color,
                  border: Border.all()
                ),
        
                margin: const EdgeInsets.all(20),
                
              );
            },
            ),
        
            ElevatedButton(onPressed: (){
              StoreProvider.of<AppState>(context).dispatch(
                ColorsChangedAction(
                  Colors.red 
                )
              );
            }, child: Text("Chnage To Red")),
        
        
            ElevatedButton( 
              onPressed: (){
                StoreProvider.of<AppState>(context).dispatch(SetUserNameAction(
                  "Tejas Thonge"
                ));
              },
              child: Text("Set Name as Tejas Thonge "),
            ),
            ElevatedButton( 
              onPressed: (){
                StoreProvider.of<AppState>(context).dispatch(ToggleFalgAction());
              },
              child: Text("Togle Flage"),
            ),
            ElevatedButton( 
              onPressed: (){
                StoreProvider.of<AppState>(context).dispatch( 
                  AddIemAction("New Item")
                );
              },
              child: Text("Add Item"),
            ),

            ElevatedButton(onPressed: (){
              StoreProvider.of<AppState>(context).dispatch(
                SetIntVlueAction(42)
              );
            }, child: Text("set to 43"))
          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton( 

        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=>SecondScreeen())
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}