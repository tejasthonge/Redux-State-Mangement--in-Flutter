


class CountterState{

  int counter;

  CountterState({required this.counter});

  factory CountterState.intialState(){
    return CountterState(counter: 0);
  }

  CountterState coppyWith({int? counter}){
    return CountterState(counter: counter?? this.counter);
  }
}
