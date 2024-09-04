import 'package:_3_shopping_cart_app/add_item_deatail.dart';
import 'package:_3_shopping_cart_app/shoping_list.dart';
import 'package:flutter/material.dart';

class ShopingCart extends StatelessWidget {
  const ShopingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart app"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [Text("we are crreating ths app by using redux as statge mangement")],
        ),
      ),
      body: ShopoingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _oppenAddToDoDiloag(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _oppenAddToDoDiloag(BuildContext context) {
    showDialog(context: context, builder: (context) => AddItemImCart());
  }
}
