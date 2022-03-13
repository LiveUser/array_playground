# array_playground

Useful extensions for Lists

Hecho en 🇵🇷 por Radamés J. Valentín Reyes

## Import

~~~dart
import 'package:array_playground/array_playground.dart';
~~~

## AsyncRemoveWhere

An async function to remove all items where the function's criteria isn't met.

~~~dart
List<int> dataArray = [15,18,11,25,63];
print("Original array:");
print(dataArray);
//Await for the completion and supply an asynchronus function where a dynamic argument(will have the type of the items contained in the List) will be tested and must return true if you want the item removed and false if you want to keep it
await dataArray.asyncRemoveWhere((a)async{
  return (15 < a && a <= 25);
});
print("Resulting array:");
print(dataArray);
~~~



