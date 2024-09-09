


import 'dart:developer';

import 'package:_4_combine_reducer/redux/app_state.dart';
import 'package:_4_combine_reducer/redux/item_list/item_list_actions.dart';
import 'package:_4_combine_reducer/redux/item_list/item_list_state.dart';
import 'package:_4_combine_reducer/redux/search_term/search_term_action.dart';

AppState reducer(AppState state ,dynamic actions){

  if(actions is AddItemAction){
   final itemListState = state.itemListState;
   final newItem = actions.item;
   final newItems = [...itemListState.items,newItem];
   final newItemListState = itemListState.copyWith( items: newItems);
   return AppState( 
    itemListState: newItemListState,
    searchTermState: state.searchTermState,
  
   );
  }
  else if(actions is DeletItemAction){
   final itemListState = state.itemListState;
   final newItems = itemListState.items.where((item)=> item != actions.item).toList();
   final newItemState = itemListState.copyWith( items: newItems);
   return AppState(
    itemListState: newItemState,
    searchTermState: state.searchTermState,
   );
  }
  else if(actions is SearchTermAction){
   final serchTermState = state.searchTermState;
   final newSearchTermState = serchTermState.copyWith( searchTerm: actions.searchTerm);
   return AppState( 
    itemListState: state.itemListState,
    searchTermState: newSearchTermState,
   );
  }

  return state;
}