import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/login.dart';
import 'package:get/get.dart';

import '../service/service_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwdController.dispose();

    super.dispose();
  }

  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  clearText() {
    emailController.clear();
    passwdController.clear();
  }

  var email = '';
  var password = '';

  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  // Future<void> addUser() {
  //   return users
  //       .add({
  //         'userName': email,
  //         'password': password,
  //       })
  //       .then(
  //         (value) => debugPrint('User Added'),
  //       )
  //       .catchError(
  //         (onError) => debugPrint('Failed to add new user: $onError'),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color.fromARGB(255, 226, 151, 239), Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image@.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome to SignUp page',
                        style: TextStyle(
                            fontSize: 29, fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   "'People who love to eat are always the best people'",
                      //   style: GoogleFonts.alexBrush(
                      //       fontSize: 30, fontWeight: FontWeight.bold),
                      // )
                    ],
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email:',
                    prefixIcon: const Icon(Icons.mail),
                    labelStyle: const TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    // errorStyle:
                    //     TextStyle(color: Colors.redAccent, fontSize: 15)
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cant be blank';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: passwdController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Password:',
                      labelStyle: const TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      errorStyle: const TextStyle(
                          color: Colors.redAccent, fontSize: 15)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cant be blank';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Get.snackbar('Added', 'User added successfully',
                        //     duration: const Duration(seconds: 3));
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          setState(() {
                            email = emailController.text;
                            password = passwdController.text;
                            // var signup =
                            controller.registerUser(email, password);
                            // if (signup == true) {
                            //   Get.to(const FinalLogInPage());
                            // }

                            // addUser();
                          });
                        }
                      },
                      child: const Text('Register'),
                    ),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
