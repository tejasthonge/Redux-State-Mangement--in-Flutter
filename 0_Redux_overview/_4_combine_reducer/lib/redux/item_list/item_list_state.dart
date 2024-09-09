

class ItemListState { 


  final List<String> items;

  ItemListState( 
    {required this.items}
  );

  factory ItemListState.intialState(){
    return ItemListState(items: []);
  }

  @override
  String toString()=> "items $items";
  

  ItemListState copyWith({ List<String>? items}){
    return ItemListState(items: items?? this.items);
  }


}