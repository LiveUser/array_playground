library array_playground;

import 'package:flutter/foundation.dart';

extension AsyncRemoveWhere on List{
  Future<void> asyncRemoveWhere(Future<bool> test(dynamic a))async{
    //Keep track of how many  items have been removed
    int itemsRemoved = 0;
    //Check each item on the list
    for(int i = 0; i < this.length;  i++){
      //The item position that will be affected depending on the amount of items removed
      int itemPosition = i - itemsRemoved;
      if(await test(this[itemPosition])){
        //Remove the item at the specified index
        this.removeAt(itemPosition);
        //Add 1 to the amount of items removed
        itemsRemoved++;
      }
    }
  }
  Future<List> multiThreadRemoveWhere(bool Function(dynamic item) shouldRemoveItem)async{
    return await compute(_rwFunction, {
      "shouldRemoveItem" : shouldRemoveItem,
      "list" : this,
    });
  }
}
Future<List> _rwFunction(Map<String,dynamic> parameters)async{
  List filteredList = [];
  for(int i = 0; i < parameters["list"].length; i++){
    if(parameters["shouldRemoveItem"](parameters["list"][i])){
      filteredList.add(parameters["list"][i]);
    }
  }
  return filteredList;
}