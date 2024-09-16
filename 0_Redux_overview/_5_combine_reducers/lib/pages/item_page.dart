

import 'package:_5_combine_reducers/pages/new_item.dart';
import 'package:_5_combine_reducers/pages/search_item.dart';
import 'package:_5_combine_reducers/pages/show_item.dart';
import 'package:flutter/material.dart';
class ItemPages extends StatelessWidget {
  const ItemPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold( 

        body: SingleChildScrollView( 

          child: Padding(
            // height: MediaQuery.of(context).size.height,
            padding:EdgeInsets.all(20),  
            child: Column( 

              children:[ 

                NewItem(),
                SizedBox(height: 20,),
                SearchItem(),
                SizedBox(height: 20,),
                ShowItem()
              ],
            ),

          ),
        ),
      ),
    );
  }
}