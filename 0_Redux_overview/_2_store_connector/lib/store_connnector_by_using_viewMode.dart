

 import 'package:_2_store_connector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProfonmanceOptimazation extends StatelessWidget {
  final State<CounterState> store;
  const ProfonmanceOptimazation({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    
    return StoreConnector(converter: 
    
      builder: (context, vm) => Scaffold( 

      ),
     );
  }
}

class ViewModel{ 

  
}