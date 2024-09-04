import 'package:_3_shopping_cart_app/models/cart_item.dart';
import 'package:_3_shopping_cart_app/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddItemImCart extends StatelessWidget {
   AddItemImCart({super.key});
  final TextEditingController _nameTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const Text("Add Item"),
      contentPadding:const EdgeInsets.all(10),
      content:  Row(
        children: [
          Expanded(
              child: TextField(
              controller: _nameTEC,
              autofocus: true,
              decoration:const InputDecoration(
              hintText: "eg. Iphone",
            ),
          ))
        ],
      ),
      actions: [const BackButton(), ElevatedButton(onPressed: () {
         StoreProvider.of<List<CartItem>>(context).dispatch(AddItemAction(CartItem( 
          checkBox: false,name:_nameTEC.text.trim() 
         )));
      }, child: const Text("Add"))],
    );
  }
}
