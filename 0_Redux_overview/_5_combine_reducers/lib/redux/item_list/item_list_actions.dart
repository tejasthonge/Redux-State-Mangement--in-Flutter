


class AddItemAction{ 

  final String item;
  AddItemAction({required this.item});

  @override
  String toString() => 'Added item: $item';

}

class DeletItemAction{

  final String item;
  DeletItemAction({required this.item});

  @override
  String toString() => 'Deleted item: $item';
}