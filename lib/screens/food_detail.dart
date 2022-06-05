import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/food_service.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/utils/style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/service/cart_controller.dart';

import '../classes/food_class.dart';
import 'cart_screen.dart';

class FoodDetail extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final int index;

  final FoodService foodcontroller = Get.put(FoodService());
  // const FoodDetail(this.imagePath);
  FoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {
            controller.addFood(foodcontroller.foods[index]),
            Get.to(const CartItems())
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(
                text: 'Place an Order',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              const Icon(Icons.chevron_right)
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: foodcontroller.foods[index].name,
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      text: 'Price    :',
                      size: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    PrimaryText(
                      text: '${foodcontroller.foods[index].price}',
                      size: 30,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          text: 'Description',
                          color: AppColors.lightGray,
                          size: 25,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        PrimaryText(
                            text: foodcontroller.foods[index].description,
                            size: 18,
                            fontWeight: FontWeight.bold),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: foodcontroller.foods[index].imageUrl,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade400, blurRadius: 30),
                      ],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 200,
                    child: Image.asset(
                        'assets/images/' +
                            foodcontroller.foods[index].imageUrl +
                            ".png",
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // PrimaryText(
                //     text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
                // const SizedBox(
                //   height: 15,
                // ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 100,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: ingredients.length,
          //     itemBuilder: (context, index) => Padding(
          //       padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
          //       child:
          //           ingredientCard(ingredients[index]['imagePath'].toString()),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 100,
          // )
        ],
      ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey.shade300),
            ]),
        child: Image.asset(
          imagePath,
          width: 90,
        ));
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey.shade300)),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.star, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}


// floatingActionButton: ConstrainedBox(
//         constraints:
//             BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
//         child: ElevatedButton(
//           onPressed: () => {
//             // controller.addFood(),
//             Get.to(const CartItems())
//           },
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               PrimaryText(
//                 text: 'Place an Order',
//                 fontWeight: FontWeight.w600,
//                 size: 18,
//               ),
//               Icon(Icons.chevron_right)
//             ],
//           ),
//           style: ElevatedButton.styleFrom(
//               primary: AppColors.primary,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//               textStyle:
//                   const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,