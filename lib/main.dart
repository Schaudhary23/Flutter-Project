import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/SignUppage.dart';
import 'package:flutter_application_1/screens/cart_screen.dart';
import 'package:flutter_application_1/screens/food_detail.dart';
import 'package:flutter_application_1/screens/food_screen.dart';
//import 'package:flutter_application_1/screens/food_screen.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:get/get.dart';

import 'authentication/login.dart';
import 'firebase_options.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const FinalLogInPage(),
//         '/second': (context) => const SignUpPage()
//       },
//       theme: ThemeData(
//         fontFamily: 'Roboto',
//         hintColor: const Color(0xFFd0cece),
//         primarySwatch: Colors.yellow,
//       ),
//       // home: const FinalLogInPage(),
//     ));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MainPage(),
    // getPages: [GetPage(name: '/', page: ()=>const HomePage()),
    // GetPage(name: '/second', page: ()=>const FoodScreen()),
    // GetPage(name: '/third', page: ()=>const CartItems())],
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => const FinalLogInPage(),
    //   '/second': (context) => const SignUpPage(),
    //   '/third': (context) => const HomePage()
    // },
    theme: ThemeData(
      fontFamily: 'Roboto',
      hintColor: const Color(0xFFd0cece),
      primarySwatch: Colors.yellow,
    ),
    // home: const FinalLogInPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 151, 239),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else {
                return const FinalLogInPage();
              }
            }),
      );
}
