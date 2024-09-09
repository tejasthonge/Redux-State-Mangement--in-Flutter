


import 'package:_4_combine_reducer/redux/item_list/item_list_state.dart';
import 'package:_4_combine_reducer/redux/search_term/search_term_state.dart';

class AppState { 
  final ItemListState itemListState;
  final SearchTermState searchTermState;

  AppState({required this.itemListState, required this.searchTermState});


  factory AppState.intialState()=> AppState(itemListState: ItemListState.intialState(), searchTermState: SearchTermState.intialState());

  @override
  String toString() => "searchTerm is ${searchTermState.searchTerm} && itemsList ${itemListState.items}";

  AppState copyWith({SearchTermState? searchTermState ,ItemListState? itemListState})=>AppState(itemListState: itemListState??this.itemListState, searchTermState: searchTermState?? this.searchTermState,);


}