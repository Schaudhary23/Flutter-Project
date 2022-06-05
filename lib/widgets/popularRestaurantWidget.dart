import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/food_screen.dart';
import 'package:flutter_application_1/service/retaurant_service.dart';
import 'package:get/get.dart';

class PopularRestaurantWidget extends StatefulWidget {
  const PopularRestaurantWidget({Key? key}) : super(key: key);

  @override
  State<PopularRestaurantWidget> createState() =>
      _PopularRestaurantWidgetState();
}

class _PopularRestaurantWidgetState extends State<PopularRestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      child: Column(
        children: [
          const PopularRestaurantTitle(),
          Expanded(
            child: PopularRestaurantItems(),
          )
        ],
      ),
    );
  }
}

class PopularRestaurantTiles extends StatelessWidget {
  final int index;
  final RestaurantService restaurantService = Get.find();
  // final String name;
  // final String imageUrl;
  // final String rating;
  // final String numberOfRating;

  //String slug;

  PopularRestaurantTiles({Key? key, required this.index
      // required this.name,
      // required this.imageUrl,
      // required this.rating,
      // required this.numberOfRating,

      // required this.slug
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => FoodScreen(
              indexOfRestaurant: index,
            ));
      },
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 5, right: 2, top: 9, bottom: 1),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 245, 241, 241),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),
            ]),
            child: Card(
                color: Colors.white,
                elevation: 3,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: SizedBox(
                  width: 190,
                  height: 187,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              padding: const EdgeInsets.only(right: 1, top: 3),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Color(0xFFfb3132),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                                child: Image.asset(
                              'assets/images/' +
                                  restaurantService
                                      .restaurants[index].imageUrl +
                                  ".png",
                              width: 130,
                              height: 140,
                            )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Text(
                                restaurantService.restaurants[index].name,
                                style: const TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFfae3e2),
                                      blurRadius: 25.0,
                                      offset: Offset(0.0, 0.75),
                                    ),
                                  ]),
                              child: const Icon(
                                Icons.near_me,
                                color: Color(0xfffdc912),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                    restaurantService.restaurants[index].rating,
                                    style: const TextStyle(
                                        color: Color(0xFF6e6e71),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 3, left: 5),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xfffdc912),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xfffdc912),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xfffdc912),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xfffdc912),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFF9b9b9c),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                    "(${restaurantService.restaurants[index].numberOfRating})",
                                    style: const TextStyle(
                                        color: Color(0xFF6e6e71),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          // Container(
                          //   alignment: Alignment.bottomLeft,
                          //   padding: const EdgeInsets.only(
                          //       left: 5, top: 5, right: 5),
                          //   child: Text('\$' + price,
                          //       style: const TextStyle(
                          //           color: Color(0xFF6e6e71),
                          //           fontSize: 12,
                          //           fontWeight: FontWeight.w600)),
                          // )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PopularRestaurantTitle extends StatelessWidget {
  const PopularRestaurantTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Popluar Restaurants",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          Text(
            "See all",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

class PopularRestaurantItems extends StatelessWidget {
  final RestaurantService restaurantcontroller = Get.put(RestaurantService());
  PopularRestaurantItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        itemCount: restaurantcontroller.restaurants.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return PopularRestaurantTiles(index: index);
          // name: restaurantcontroller.restaurants[index].name.toString(),
          // imageUrl:
          //     restaurantcontroller.restaurants[index].imageUrl.toString(),
          // rating: restaurantcontroller.restaurants[index].rating.toString(),
          // numberOfRating: restaurantcontroller
          //     .restaurants[index].numberOfRating
          //     .toString(),
        },

        shrinkWrap: true,
        // children: const [
        //   PopularRestaurantTiles(
        //     name: "Desi Tadka",
        //     imageUrl: "ic_popular_food_1",
        //     rating: '4.9',
        //     numberOfRating: '200',
        //     price: '15.06',
        //   ),
        //   PopularRestaurantTiles(
        //     name: "Desi Tadka",
        //     imageUrl: "ic_popular_food_2",
        //     rating: "4.9",
        //     numberOfRating: "100",
        //     price: "17.03",
        //   ),
        //   PopularRestaurantTiles(
        //     name: "Desi Tadka",
        //     imageUrl: "ic_popular_food_1",
        //     rating: "4.0",
        //     numberOfRating: "50",
        //     price: "11.00",
        //   ),
        //   PopularRestaurantTiles(
        //     name: "Desi Tadka",
        //     imageUrl: "ic_popular_food_2",
        //     rating: "4.00",
        //     numberOfRating: "100",
        //     price: "11.10",
        //   ),
        //   PopularRestaurantTiles(
        //     name: restaurantcontroller.restaurants[],
        //     imageUrl: "ic_popular_food_2",
        //     rating: "4.6",
        //     numberOfRating: "150",
        //     price: "12.00",
        //   ),
        //   PopularRestaurantTiles(
        //     name: "Desi Tadka",
        //     imageUrl: "",
        //     rating: "4.00",
        //     numberOfRating: "100",
        //     price: "11.10",
        //   ),
        //   PopularRestaurantTiles(
        //     name: "Desi Tadka",
        //     imageUrl: "ic_popular_food_2",
        //     rating: "4.2",
        //     numberOfRating: "70",
        //     price: "23.0",
        //   ),
      ),
    );
  }
}
