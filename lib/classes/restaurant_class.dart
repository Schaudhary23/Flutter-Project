import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  int id;
  Restaurant(
      {required this.name,
      required this.imageUrl,
      required this.rating,
      required this.numberOfRating,
      required this.id});

  static Restaurant fromSnapshot(DocumentSnapshot snap) {
    Restaurant restaurant = Restaurant(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      rating: snap['rating'],
      numberOfRating: snap['numberOfRating'],
      id: snap['id'],
    );

    return restaurant;
  }
}
