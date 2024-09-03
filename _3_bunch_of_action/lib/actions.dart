



import 'package:flutter/material.dart';

class ColorsChangedAction{

  final Color color;

  ColorsChangedAction(this.color);

}

class SetUserNameAction{

  final String name;

  SetUserNameAction(this.name);
}

class ToggleFalgAction{}

class AddIemAction{
  final String item;
  AddIemAction(this.item);
}

class RemoveItemAction{

  final String item;
  RemoveItemAction(this.item);
}

class SetIntVlueAction{

  final int value;
  SetIntVlueAction(this.value);
}


