


import 'package:_5_combine_reducers/redux/item_list/item_list_state.dart';
import 'package:_5_combine_reducers/redux/search_term/search_term_state.dart';

class AppState { 
  final ItemListState itemListState;
  final SearchTermState searchTermState;

  AppState({required this.itemListState, required this.searchTermState});


  factory AppState.intialState()=> AppState(itemListState: ItemListState.initialState(), searchTermState: SearchTermState.initialState());

  @override
  String toString() => "searchTerm is ${searchTermState.searchTerm} && itemsList ${itemListState.items}";

  AppState copyWith({SearchTermState? searchTermState ,ItemListState? itemListState})=>AppState(itemListState: itemListState??this.itemListState, searchTermState: searchTermState?? this.searchTermState,);


}