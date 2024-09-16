import 'dart:developer';


import 'package:_5_combine_reducers/main.dart';
import 'package:_5_combine_reducers/redux/app_state.dart';
import 'package:_5_combine_reducers/redux/item_list/item_list_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState ,_ViewModel>(
      converter: (store)=>_ViewModel.fromStore(store),
      builder: (context,vm) {
        return TextField(
          controller: _controller,
          decoration: const InputDecoration(labelText: "Add Item"),
          onSubmitted: (String? item) {

            if(item != null && item.trim().isNotEmpty) {

              vm.addItem(item);
              _controller.clear();
            }
            log("New Added Item: " + item!);
            log("${store.state.itemListState.items}");
            
          },
        );
      }
    );
  }
}

class _ViewModel {
  final void Function(String newItem) addItem;
  const _ViewModel({
    required this.addItem,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        addItem: (String newItem) =>
            store.dispatch(AddItemAction(item: newItem)));
  }
}
