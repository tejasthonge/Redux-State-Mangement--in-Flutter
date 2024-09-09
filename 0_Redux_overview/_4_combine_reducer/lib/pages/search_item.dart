
import 'dart:developer';

import 'package:_4_combine_reducer/redux/app_state.dart';
import 'package:_4_combine_reducer/redux/search_term/search_term_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState ,_ViewModel>(
      converter: (store)=>_ViewModel.fromStore(store),
      builder: (BuildContext context,_ViewModel vm) {
        return TextField( 
        
          decoration: const InputDecoration( 
            labelText: "Search items..",
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search)
          ),
          onChanged: (String? newSearchTerm) {

            if(newSearchTerm != null){
              vm.searchIteam(newSearchTerm);
            }
            log("Searchd item is : $newSearchTerm");
          },
        );
      }
    );
  }
}


class _ViewModel {

  final void Function(String seachedTream) searchIteam;
  _ViewModel({
    required this.searchIteam, 
  });

  static fromStore(Store<AppState> store){
    return _ViewModel( 
      searchIteam: (String searchTerm)=>store.dispatch(SearchTermAction(searchTerm: searchTerm))
    );  
  }
}