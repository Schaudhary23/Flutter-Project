import 'package:get/get.dart';

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

  get foodSubttotal =>
      _food.entries.map((food) => food.key.price * food.value).toList();

  get total => _food.entries
      .map((food) => food.key.price * food.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
