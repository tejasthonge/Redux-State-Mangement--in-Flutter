import 'package:couter_by_using_middleware/redux/action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: Text("Redux Middleware"),
      ),
      body: Center(
        child: StoreConnector<int, int>(
            converter: (store) => store.state,
            builder: (context, count) {
              return Text("$count");
            }),
      ),
      floatingActionButton:
          StoreConnector<int, VoidCallback>(converter: (store) {
        return () => store.dispatch(IncrementAction());
      }, builder: (context, callback) {
        return FloatingActionButton(
          onPressed: callback,
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
