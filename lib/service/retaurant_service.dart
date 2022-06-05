import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/classes/restaurant_class.dart';
import 'package:get/get.dart';

class RestaurantDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Restaurant>> getAllRestaurant() {
    return _firebaseFirestore
        .collection('restaurants')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Restaurant.fromSnapshot(doc)).toList();
    });
  }
}

class RestaurantService extends GetxController {
  final restaurants = <Restaurant>[].obs;

  @override
  void onInit() {
    restaurants.bindStream(RestaurantDB().getAllRestaurant());
    super.onInit();
  }
}
