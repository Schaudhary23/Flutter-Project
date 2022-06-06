import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart_screen.dart';
import 'package:flutter_application_1/screens/food_detail.dart';
import 'package:flutter_application_1/service/cart_controller.dart';
import 'package:flutter_application_1/service/food_service.dart';
import 'package:flutter_application_1/service/retaurant_service.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/utils/style.dart';

import 'package:badges/badges.dart';
import 'package:get/get.dart';

import '../classes/food_class.dart';

var check;

class FoodScreen extends StatefulWidget {
  final int indexOfRestaurant;
  const FoodScreen({Key? key, required this.indexOfRestaurant})
      : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final FoodService foodcontroller = Get.put(FoodService());

  int selectedFoodCard = 0;

  // FoodService foodlist = FoodService();
  final CartController cartController = Get.put(CartController());
  final RestaurantService rs = Get.put(RestaurantService());
  @override
  Widget build(BuildContext context) {
    if (selectedFoodCard == 0) {
      setState(() {
        check = foodcontroller.foods
            .where((food) =>
                food.id == rs.restaurants[widget.indexOfRestaurant].id ||
                food.selectedCard == selectedFoodCard)
            .toList();
      });
    } else {
      setState(() {
        check = foodcontroller.foods
            .where((food) =>
                food.id == rs.restaurants[widget.indexOfRestaurant].id &&
                food.selectedCard == selectedFoodCard)
            .toList();
      });
    }

    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
          actions: [
            Badge(
              badgeColor: const Color(0xfffdc912),
              position: BadgePosition.topStart(top: 0),
              badgeContent: Text(
                cartController.foods.length.toString(),
              ),
              child: IconButton(
                onPressed: () {
                  Get.to(CartItems());
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 20),
                  //   child: PrimaryText(
                  //     text: 'Food',
                  //     size: 22,
                  //   ),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: PrimaryText(
                      text: 'Food Delivery',
                      height: 1.1,
                      size: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(width: 20),
                      Icon(
                        Icons.search,
                        color: AppColors.secondary,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.lighterGray)),
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                              color: AppColors.lightGray,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: PrimaryText(
                        text: 'Categories',
                        fontWeight: FontWeight.w700,
                        size: 22),
                  ),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodCategoryList.length,
                      itemBuilder: (context, indexOfCategory) => Padding(
                        padding: EdgeInsets.only(
                            left: indexOfCategory == 0 ? 25 : 0),
                        child: foodCategoryCard(
                            foodCategoryList[indexOfCategory]['name']
                                .toString(),
                            indexOfCategory),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: PrimaryText(
                        text: 'Popular', fontWeight: FontWeight.w700, size: 22),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      // physics: const ScrollPhysics(),
                      itemCount: check.length,
                      itemBuilder: (context, index) {
                        return popularFoodCard(
                            check[index].imageUrl,
                            check[index].name,
                            check[index].price,
                            index,
                            check[index].description,
                            check);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget popularFoodCard(String imageUrl, String name, double price, int index,
      String description, List<Food> check) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(
                      name: name,
                      imageUrl: imageUrl,
                      price: price,
                      description: description,
                      index: index,
                      check: check,
                    )))
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: AppColors.lighterGray)
          ],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          // PrimaryText(
                          //   text: 'top of the week',
                          //   size: 16,
                          // )
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: name, size: 22, fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: price.toString(),
                          size: 18,
                          color: AppColors.lightGray),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 20),
                        decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: ElevatedButton(
                          onPressed: () {
                            cartController.addFood(check[index]);
                          },
                          child: const Icon(Icons.add, size: 20),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    // SizedBox(
                    //   child: Row(
                    //     children: [
                    //       const Icon(Icons.star, size: 12),
                    //       const SizedBox(width: 5),
                    //       PrimaryText(
                    //         text: star,
                    //         size: 18,
                    //         fontWeight: FontWeight.w600,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 20)
                  ]),
              child: Hero(
                tag: imageUrl,
                child: Image.asset('assets/images/' + imageUrl + ".png",
                    width: MediaQuery.of(context).size.width / 2.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            selectedFoodCard = index,
          },
        ),
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                selectedFoodCard == index ? AppColors.primary : AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: selectedFoodCard == index
                    ? AppColors.white
                    : AppColors.tertiary,
                shape: const CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedFoodCard == index
                        ? AppColors.black
                        : AppColors.white))
          ],
        ),
      ),
    );
  }
}
