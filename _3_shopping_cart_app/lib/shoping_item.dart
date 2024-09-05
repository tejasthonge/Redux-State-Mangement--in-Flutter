import 'package:_3_shopping_cart_app/models/cart_item.dart';
import 'package:_3_shopping_cart_app/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShopingItem extends StatelessWidget {
  final CartItem item;
  const ShopingItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // onDismissed: (direction) {
      //   StoreProvider.of<List<CartItem>>(context).dispatch(DelleatItemAction(item));
      // },
      key: Key("value"),
      child: ListTile(
        title: Text(item.name),
        leading: Checkbox(
          value: item.checkBox,
          onChanged: (value) {
            StoreProvider.of<List<CartItem>>(context).dispatch(ToggleStateAction(item));
          },
        ),
        
        // trailing: Icon(Icons.delete),
      ),
    );
  }
}
