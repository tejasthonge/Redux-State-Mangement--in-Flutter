class CartItem {
  String name;
  bool checkBox;

  CartItem({required this.name, required this.checkBox});

  @override
  String toString() {
    // TODO: implement toString
    return "name : $name , isChecked : $checkBox";
  }
}
