

import 'package:_4_combine_reducer/redux/app_state.dart';
import 'package:_4_combine_reducer/redux/item_list/item_list_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ShowItem extends StatelessWidget {
  const ShowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState ,_ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context ,vm) {
        return ListView.separated(
          itemCount: vm.items.length,
          shrinkWrap: true,  //this shrink wrap is used if we dosnot spesfise the hight then that we have true the shrink wrap property as true
          itemBuilder: (context ,index){
          String item = vm.items[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(onPressed: ()=>vm.deletItem(item), icon: Icon(Icons.delete_outline)),
          );
        }, separatorBuilder:(context ,index)=>const Divider(color:  Colors.grey,));
      }
    );
  }
}




class _ViewModel{

  final List<String> items;

  final void Function(String item) deletItem;
  
  _ViewModel({required this.items, required this.deletItem});

  static _getFilteredItems({
    required List<String> items,
    required String seachTerm,
  }){ 
    List<String> filteredItems = items;
    filteredItems = filteredItems.where(
      (item){
        if(item.toLowerCase().contains(seachTerm.toLowerCase())){
          return true;
        }
        return false;
      }
    ).toList();

    return filteredItems;
  }
  static fromStore(Store<AppState> store){
    return _ViewModel( 
      items: _getFilteredItems(items: store.state.itemListState.items, seachTerm: store.state.searchTermState.searchTerm),
      deletItem: (String item)=>store.dispatch(DeletItemAction(item: item)) 
    ) ;
  }
}