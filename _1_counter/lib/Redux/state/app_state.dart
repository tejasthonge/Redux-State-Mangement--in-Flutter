


class AppState{ 
  final int counter;  //here below we can add anthor state of the app by using this we can handle all over the state of app in this single appState instance
  

  AppState({required this.counter});
  AppState.initialState():
    counter = 0;
    
}