

import 'package:_4_quiz_app/store/app/app_state.dart';
import 'package:_4_quiz_app/store/questions/qutions_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ScoreScreen extends StatelessWidget {
  final Store<AppState> store;
  const ScoreScreen({super.key,required this.store});

  @override
  Widget build(BuildContext context) {
    return 
    StoreConnector<AppState ,_ViewModel>(
      converter: (store)=>_ViewModel.fromStore(store),
      builder: (context,vm) {
        return Scaffold(
          backgroundColor:  const Color.fromARGB(96, 169, 232, 247),
          appBar: AppBar(
            title: const Text('Score'),
            leading: IconButton(onPressed: (){
               vm.refashQuestion();
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: Center(
            child: Text('Your score is ${store.state.scoreState.noOfCorrectAnswer} out of ${store.state.scoreState.totleNoQuestions}'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              vm.refashQuestion();
              Navigator.pop(context);
            },
            child: const Icon(Icons.home_sharp),
          ),
        );
      }
    );
  }
}

class _ViewModel{

  final void Function() refashQuestion;

  _ViewModel({required this.refashQuestion});

  static _ViewModel  fromStore(Store<AppState> store)=>_ViewModel(refashQuestion: ()=>store.dispatch(RefreashQutionIndex()));
}