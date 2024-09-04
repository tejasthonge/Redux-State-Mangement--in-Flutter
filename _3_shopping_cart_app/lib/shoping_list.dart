import 'package:_3_shopping_cart_app/models/cart_item.dart';
import 'package:_3_shopping_cart_app/shoping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShopoingList extends StatelessWidget {
  final store;
  const ShopoingList({super.key,required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem> ,List<CartItem>>(
      converter:(store)=>store.state,
      builder: (context ,item) {
        return ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return ShopingItem(item: item[index],);
          },
        );
      }
    );
  }
}
