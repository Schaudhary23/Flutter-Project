// import '../classes/food_class.dart';

// class FoodService {
//   List<Food> food = [
//     Food(
//         name: 'Burger',
//         imageUrl:
//             'https://en.wikipedia.org/wiki/Hamburger#/media/File:Hamburger_(black_bg).jpg',
//         price: 200,
//         description:
//             'A sandwich consisting of one or more cooked patties, placed inside a sliced bread roll or bun roll.',
//         id: 1),
//     Food(
//         name: 'Burger',
//         imageUrl:
//             'https://en.wikipedia.org/wiki/Hamburger#/media/File:Hamburger_(black_bg).jpg',
//         price: 200,
//         description:
//             'A sandwich consisting of one or more cooked patties, placed inside a sliced bread roll or bun roll.',
//         id: 1),
//     Food(
//         name: 'Burger',
//         imageUrl:
//             'https://en.wikipedia.org/wiki/Hamburger#/media/File:Hamburger_(black_bg).jpg',
//         price: 200,
//         description:
//             'A sandwich consisting of one or more cooked patties, placed inside a sliced bread roll or bun roll.',
//         id: 1),
//     Food(
//         name: 'Burger',
//         imageUrl:
//             'https://en.wikipedia.org/wiki/Hamburger#/media/File:Hamburger_(black_bg).jpg',
//         price: 200,
//         description:
//             'A sandwich consisting of one or more cooked patties, placed inside a sliced bread roll or bun roll.',
//         id: 1),
//   ];
//   Food getFood(int index) {
//     return food[index];
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../classes/food_class.dart';

class FoodDB {
  final FirebaseFirestore _firebaseFirestore1 = FirebaseFirestore.instance;

  Stream<List<Food>> getAllFood() {
    return _firebaseFirestore1.collection('food').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Food.fromSnapshot(doc)).toList();
    });
  }
}

class FoodService extends GetxController {
  final foods = <Food>[].obs;

  @override
  void onInit() {
    foods.bindStream(FoodDB().getAllFood());
    super.onInit();
  }
}
