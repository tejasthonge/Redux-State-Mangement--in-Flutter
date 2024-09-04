//the reduser is nothing just funtion in the redux state mang. it is store the previse state and take new action and passed to the store

import 'package:_3_shopping_cart_app/models/cart_item.dart';
import 'package:_3_shopping_cart_app/redux/actions.dart';

List<CartItem> cartItemReduserList(List<CartItem> state, dynamic action) {
  if (action is AddItemAction) {
    //then we do some thing
    return addItem(state, action);
  } else if (action is ToggleStateAction) {
    return toggleChecBox(state, action);
  } else if (action is DelleatItemAction) {
    return deleatItem(state, action);
  }

  return state;
}

List<CartItem> addItem(List<CartItem> state, AddItemAction action) {
  return List.from(state)..add(action.item);
}

List<CartItem> toggleChecBox(List<CartItem> state, ToggleStateAction action) {
  List<CartItem> newItemList = [];

  for (var item in state) {
    if (item.name == action.item.name) {
      item.checkBox = !item.checkBox;
    }
    newItemList.add(item);
  }
  return newItemList;
}

List<CartItem> deleatItem(List<CartItem> state, DelleatItemAction action) {
  return List.from(state)..remove(action.item);
}
