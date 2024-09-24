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
              //this is asynchronous call so it will take time as well thire are some
              //asumptions go get following type 
              // -- we are know that so we allready write in code 
              // -- depending on that type of statues we will show the results on the screen 
              // -- this is easy to handle by using the middleware 

              //firest we dispatch the getProductAction but in that action thire is not 
              //code to get the product it just action class class containing the variable of List<Product> type i
              // -- this theis instance variable intialy empty but we call the GetProductAction 
              //   -- so we handle the logic in the middleware for the resion of 
              //    1.its is asynchronus 
              //    2.what type of result we will return we dont know 
              //    3.by uing the middleware function it is esay to handle the the action depending upon the result 
              //    4.and middleware have to abality to pass the respetive result which is actually action to the reducer 
              //    5.and reducer is required parameter of the store and store is single instace that store all over states and state store the resupective type of  data that wass geted form what type of action is dispathced
              //    6. so if we get the result of the GetProductAction then we can handle it as per the requirement
              //    7. and if we get any other type of action then we can handle it in the reducer according to the requirement
              //    8. so we can write a middleware function that will check the type of the action and then handle the action according to the requirement 
              //    9. and middleware is very useful for handling the asynchronous call and it is easy to handle the the action depending upon the result 
              //    10. we can also handle the error case by using the middleware and in the reducer we can handle the error case as well

           
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
