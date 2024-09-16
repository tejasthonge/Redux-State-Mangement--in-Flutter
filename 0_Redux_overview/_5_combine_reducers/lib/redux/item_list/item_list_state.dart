

// class ItemListState { 


//   final List<String> items;

//   ItemListState( 
//     {required this.items}
//   );

//   factory ItemListState.intialState(){
//     return ItemListState(items: []);
//   }

//   @override
//   String toString()=> "items $items";
  

//   ItemListState copyWith({ List<String>? items}){
//     return ItemListState(items: items?? this.items);
//   }


// }



class ItemListState { 
  final List<String> items;

  ItemListState({required this.items});

  factory ItemListState.initialState() => ItemListState(items: []);
  
  @override
  String toString() => 'ItemListState(items: $items)';
  
  
  ItemListState copyWith({List<String>? items}) => ItemListState(items: items?? this.items);
}