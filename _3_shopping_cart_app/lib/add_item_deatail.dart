import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddItemImCart extends StatelessWidget {
  const AddItemImCart({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Item"),
      contentPadding: EdgeInsets.all(10),
      content: const Row(
        children: [
          Expanded(
              child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "eg. Iphone",
            ),
          ))
        ],
      ),
      actions: [const BackButton(), ElevatedButton(onPressed: () {}, child: const Text("Add"))],
    );
  }
}
