import 'package:flutter_test/flutter_test.dart';
import 'package:array_playground/array_playground.dart';

void main() {
  test('AsyncRemoveWhere test', () async{
    List<int> dataArray = [15,18,11,25,63];
    print("Original array:");
    print(dataArray);
    await dataArray.asyncRemoveWhere((a)async{
      return (15 < a && a <= 25);
    });
    print("Resulting array:");
    print(dataArray);
  });
  test('Multi threaded remove where', ()async{
    List<int> dataArray = [15,18,11,25,63];
    dataArray = await dataArray.multiThreadRemoveWhere((item){
      if(item == 11){
        return true;
      }else{
        return false;
      }
    });
  });
}
