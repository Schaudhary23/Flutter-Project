import 'package:get/get.dart';
import 'package:collection/collection.dart';
import '../classes/food_class.dart';

class CartController extends GetxController {
  final _food = {}.obs;

  void addFood(Food food) {
    if (_food.containsKey(food)) {
      _food[food] += 1;
    } else {
      _food[food] = 1;
    }
  }

  void removeFood(Food food) {
    if (_food.containsKey(food) && _food[food] == 1) {
      _food.removeWhere((key, value) => key == food);
    } else {
      _food[food] -= 1;
    }
  }

  get foods => _food;

  get subTotal =>
      _food.entries.map((food) => food.key.price * food.value).toList();

  get total {
    num sum = 0;
    for (int i = 0; i < subTotal.length; i++) {
      sum = sum + subTotal[i];
    }
    return sum;
    // subTotal
    //   .reduce((value, element) => value + element)
    //   .toList()
    //   .toStringAsFixed(2);
  }
}
