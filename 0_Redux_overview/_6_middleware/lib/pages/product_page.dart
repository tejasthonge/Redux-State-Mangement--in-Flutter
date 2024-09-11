

import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar( 

        title: const Text("Product Details"),
      ),

      body: Center( 

        child: Text("Product"),
      ),
    );
  }
}