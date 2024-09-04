import 'package:_3_shopping_cart_app/shoping_item.dart';
import 'package:flutter/material.dart';

class ShopoingList extends StatelessWidget {
  const ShopoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 19,
      itemBuilder: (context, index) {
        return ShopingItem();
      },
    );
  }
}
