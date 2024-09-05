

import 'package:_3_shopping_cart_app/add_item_deatail.dart';
import 'package:_3_shopping_cart_app/shoping_list.dart';
import 'package:flutter/material.dart';

class ShopingCart extends StatelessWidget {
  final store ;
  const ShopingCart({super.key,required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart app"),
        centerTitle: true,
      ),
      drawer:Drawer(
        child: Center(
          child: SizedBox(

            height: MediaQuery.of(context).size.height,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [Text("we are crreating ths app by using redux as statge mangement")],
            ),
          ),
        ),
      ),
      body: ShopoingList(store: store,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _oppenAddToDoDiloag(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _oppenAddToDoDiloag(BuildContext context) {
    showDialog(context: context, builder: (context) => AddItemImCart());
  }
}
