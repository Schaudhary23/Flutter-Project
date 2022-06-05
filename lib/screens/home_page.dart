import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/SearchWidget.dart';
import 'package:flutter_application_1/widgets/SliderWidget.dart';
import 'package:flutter_application_1/widgets/popularRestaurantWidget.dart';
import 'package:get/get.dart';

import '../service/service_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffdc912),
        elevation: 0,
        title: const Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {
                controller.signOut();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SearchWidget(),
            SliderWidget(),
            PopularRestaurantWidget(),
          ],
        ),
      ),
    );
  }
}
