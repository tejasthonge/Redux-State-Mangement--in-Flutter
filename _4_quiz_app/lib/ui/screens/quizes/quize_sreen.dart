import 'dart:math';

import 'package:_4_quiz_app/data/quizes.dart';
import 'package:_4_quiz_app/store/ansswer/actions.dart';
import 'package:_4_quiz_app/store/app/app_state.dart';
import 'package:_4_quiz_app/store/questions/question_state.dart';
import 'package:_4_quiz_app/store/questions/qutions_action.dart';
import 'package:_4_quiz_app/store/score/score_actions.dart';
import 'package:_4_quiz_app/ui/screens/quizes/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class QuizeSreen extends StatelessWidget {
  final Store<AppState> store;

  const QuizeSreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (context, _ViewModel vm) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(96, 169, 232, 247),
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.question_answer_outlined,color:  Color.fromARGB(255, 107, 221, 221),)),
              title: const Text(
                "Flutter Quiz",
                style: TextStyle(
                    color: Color.fromARGB(255, 107, 221, 221),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 172, 172, 169),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  // height: 60,
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(255, 255, 135, 7)),
                  child: Text(
                    "${store.state.questionState.currentQutionIndex +1}. ${vm.question}",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.options.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: store.state.sellectedAnsswerState.sellctedAnsswerIndex ==store.state.questionState.carrectAnsIndex &&index ==store.state.sellectedAnsswerState.sellctedAnsswerIndex
                                  ? Colors.green: 
                                  store.state.sellectedAnsswerState.sellctedAnsswerIndex !=store.state.questionState.carrectAnsIndex &&index ==store.state.sellectedAnsswerState.sellctedAnsswerIndex?
                                   Colors.red :
                                   store.state.sellectedAnsswerState.sellctedAnsswerIndex != -1 &&index ==store.state.questionState.carrectAnsIndex ?
                                   Colors.green:
                                   const Color.fromARGB(255, 152, 137, 137),
                              borderRadius: BorderRadius.circular(4)),
                          child: ListTile(
                            onTap: () {
                              if(store.state.sellectedAnsswerState.sellctedAnsswerIndex == -1){
                                vm.sellOption(index);
                                vm.setScore(index);
                               }
                            },
                            leading: Text((index + 1).toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(148, 253, 249, 249),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                )),
                            title: Text(
                              vm.options[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ))
              ]),
            ),
            floatingActionButton: InkWell(
              onTap: () {
                if( questionsList.length> store.state.questionState.currentQutionIndex+1){
                  vm.nexQution(store.state.questionState.currentQutionIndex + 1);
                }
                else{
                  Navigator.of(context).push( 
                    MaterialPageRoute(builder: (_)=>ScoreScreen(store: store,))
                  );
                }
                vm.refreshSellctedAnsIndex();
              },
              child: Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child:  Text(
                  questionsList.length!= store.state.questionState.currentQutionIndex+1?
                  "NEXT":
                  "SCORE"
                  ,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        });
  }
}

class _ViewModel {
  String question;
  List<String> options;
  final void Function(int sellectedOtpionIndex) sellOption;
  final void Function(int sellectedOtpionIndex) setScore;
  final void Function(int nextQutionIndex) nexQution;
  final void Function() refreshSellctedAnsIndex;

  _ViewModel(

      {required this.refreshSellctedAnsIndex,
      required this.question,
      required this.options,
      required this.sellOption,
      required this.setScore,
      required this.nexQution});
  static fromStore(Store<AppState> store) {
    return _ViewModel(
      
      question: store.state.questionState.question,
      options: store.state.questionState.options,
      sellOption: (index) => store.dispatch(
          SellectOtionAction(index, store.state.questionState.carrectAnsIndex)),
      nexQution: (index) =>
          store.dispatch(NextQutionAction(nextQutionIndex: index)),
      refreshSellctedAnsIndex: () =>
          store.dispatch(RefreshSellectedOptionIndexAction()),
      setScore: (sellectedOtpionIndex) => store.dispatch(AddScoreAction(sellectedAnsIndex: sellectedOtpionIndex)),
    );
  }
}
