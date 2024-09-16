


import 'dart:developer';

import 'package:_5_combine_reducers/redux/app_state.dart';
import 'package:_5_combine_reducers/redux/item_list/item_list_actions.dart';
import 'package:_5_combine_reducers/redux/item_list/item_list_state.dart';
import 'package:_5_combine_reducers/redux/search_term/search_term_action.dart';
import 'package:_5_combine_reducers/redux/search_term/search_term_state.dart';

AppState reducer(AppState state ,dynamic actions){

 
  

  return state.copyWith( 
    itemListState: itemListReduser(state.itemListState, actions),
    searchTermState:  searchTermReducer(state.searchTermState, actions)
  );
}


// ---------------------------------------------------------------->Combine Reduser <----------------------------------------------------------------


ItemListState itemListReduser(ItemListState state ,dynamic action){

   if(action is AddItemAction){
   final itemListStateItem = state.items;
   final newItem =action.item;
   final newItems = [...itemListStateItem,newItem];
   final newItemListState = state.copyWith( items: newItems);
   return newItemListState;
  }
  else if(action is DeletItemAction){
   final itemListStateItem = state.items;
   final newItems = itemListStateItem.where((item)=> item != action.item).toList();
   final newItemState = state.copyWith( items: newItems);
   return newItemState;
  }
  return state;
}


SearchTermState searchTermReducer(SearchTermState state , dynamic action ){
   if(action is SearchTermAction){
   
   final newSearchTermState = state.copyWith( searchTerm: action.searchTerm);
   return  newSearchTermState;
  }
  return state;
}
