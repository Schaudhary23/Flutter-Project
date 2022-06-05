import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String name;
  final String imageUrl;
  final String description;
  final String category;
  final int price;
  final int id;
  final int selectedCard;
  const Food(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.category,
      required this.description,
      required this.id,
      required this.selectedCard});

  static Food fromSnapshot(DocumentSnapshot snap) {
    Food food = Food(
        name: snap['name'],
        imageUrl: snap['imageUrl'],
        description: snap['description'],
        category: snap['category'],
        price: snap['price'],
        id: snap['id'],
        selectedCard: snap['selectedCard']);
    return food;
  }
}
