import 'package:_3_shopping_cart_app/models/cart_item.dart';

class AddItemAction {
  final CartItem item;
  AddItemAction(this.item);
}

class ToggleStateAction {
  final CartItem item;
  ToggleStateAction(this.item);
}

class DelleatItemAction {
  final CartItem item;
  DelleatItemAction(this.item);
}
