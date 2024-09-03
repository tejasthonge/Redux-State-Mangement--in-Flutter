

import 'package:_3_bunch_of_action/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SecondScreeen extends StatelessWidget {
  const SecondScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text( 
          "To Change the Value go to fist page"
        ),
      ),

      body: StoreConnector<AppState ,AppState>( 
        converter: (store) => store.state,//in fist we just focusing ont he Container only so the only that value are accessible for me but now the code is differ as comaper to befor
        // here we are fetching all the data from the store  the resons is Store have generic type of appState so we can access it 
        builder: (context, vm) {
          return  Center(
            child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text("${vm.userName}"),
              Text(vm.flag.toString()),
              Text(vm.intValue.toString())

            ],
                    ),
          );
        },
      )

    );
  }
}