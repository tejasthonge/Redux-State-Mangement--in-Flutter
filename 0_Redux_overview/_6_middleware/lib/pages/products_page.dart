// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import 'package:_6_middleware/redux/app_state.dart';
import 'package:_6_middleware/redux/products/products_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:_6_middleware/models/product_model.dart';
import 'package:_6_middleware/redux/products/products_state.dart';
import 'package:redux/redux.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products Details"),
        ),
        body: StoreConnector<AppState, _ViewModel>(
            converter: (Store<AppState> store) => _ViewModel.fromStore(store),
            distinct: true,
            onInit: (store) => store.dispatch(GetProductsAction()),
            builder: (BuildContext context, _ViewModel vm) {
              if (vm.statues == ProductStatues.initial) {
                return Container();
              } else if (vm.statues == ProductStatues.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (vm.statues == ProductStatues.failure) {
                return Center(
                  child:
                      Text("something went wrong please try again some time"),
                );
              } else {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2
                    ),
                    itemCount: vm.products.length,
                    itemBuilder: (context, index) {
                      final product = vm.products[index];
                      return GridTile(
                          footer: GridTileBar(
                            title: Text(product.title),
                            subtitle: Text(product.category),
                            trailing: Text(product.price.toString()),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(product.image,
                              fit: BoxFit.contain,
                            ),
                          ));
                    });
              }
            }));
  }
}

class _ViewModel {
  final String error;
  final List<Product> products;
  final ProductStatues statues;
  _ViewModel({
    required this.error,
    required this.products,
    required this.statues,
  });

  static fromStore(Store<AppState> store) => _ViewModel(
      error: store.state.productsState.error,
      products: store.state.productsState.products,
      statues: store.state.productsState.productStatues);
}
