import 'package:_3_shopping_cart_app/models/cart_item.dart';
import 'package:_3_shopping_cart_app/redux/redusers.dart';
import 'package:_3_shopping_cart_app/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<List<CartItem>> store = Store<List<CartItem>>(cartItemReduserList, initialState: []);
  runApp(ShopingApp(
    store: store,
  ));
}

class ShopingApp extends StatelessWidget {
  final Store<List<CartItem>> store;
  const ShopingApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const ShopingCart(),
      debugShowCheckedModeBanner: false,
    );
  }
}
