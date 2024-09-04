import 'package:flutter/material.dart';

class ShopingItem extends StatelessWidget {
  const ShopingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("value"),
      child: ListTile(
        title: Text("TODO: Item"),
        leading: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        trailing: Icon(Icons.delete),
      ),
    );
  }
}
