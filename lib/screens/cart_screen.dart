import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/cart_controller.dart';
import 'package:get/get.dart';

import '../utils/style.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);
  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Cart Page',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: PrimaryText(
                    text: 'Your Order Summary',
                    size: 28,
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 500,
                child: cartController.foods.keys.toList().length == 0
                    ? const Text('No Items In The Cart',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))
                    : ListView.builder(
                        itemCount: cartController.foods.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    'assets/images/' +
                                        cartController.foods.keys
                                            .toList()[index]
                                            .imageUrl +
                                        ".png",
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(cartController.foods.keys
                                      .toList()[index]
                                      .name),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartController.addFood(cartController
                                        .foods.keys
                                        .toList()[index]);
                                  },
                                  icon: const Icon(Icons.add_circle),
                                ),
                                Text(
                                    '${cartController.foods.values.toList()[index]}'),
                                IconButton(
                                  onPressed: () {
                                    cartController.removeFood(cartController
                                        .foods.keys
                                        .toList()[index]);
                                  },
                                  icon: const Icon(Icons.remove_circle),
                                ),
                              ],
                            ),
                          );
                        })),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: totalWindow(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const PrimaryText(text: 'Checkout'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget totalWindow() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${cartController.total}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
