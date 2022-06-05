import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../service/service_controller.dart';
import 'package:get/get.dart';

import 'SignUppage.dart';

class FinalLogInPage extends StatefulWidget {
  const FinalLogInPage({Key? key}) : super(key: key);

  @override
  State<FinalLogInPage> createState() => _FinalLogInPageState();
}

class _FinalLogInPageState extends State<FinalLogInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color.fromARGB(255, 226, 151, 239), Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Column(children: [
          // Container(
          //   width: w,
          //   height: h * 0.3,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/pizza-1.pg'),
          //         fit: BoxFit.cover),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(10),
          //     ),
          //   ),
          // ),
          Container(
            width: w,
            height: h * 0.2,
            child: Center(
              child: Text(
                'Eat Good\n        Feel good',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, color: const Color.fromARGB(255, 21, 23, 18)),
              ),
            ),
          ),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Welcome',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 40, 44, 44))),
              Text(
                'Sign into your account',
                style: GoogleFonts.aBeeZee(fontSize: 15),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                  child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Enter your username',
                          prefixIcon: const Icon(Icons.mail),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cant be blank';
                        }
                        return null;
                      })),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password cant be blank';
                      }
                      return null;
                    },
                  )),
            ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ElevatedButton(
                    onPressed: () {
                      var result =
                          controller.validateUser(email.text, password.text);
                      if (result == true) {
                        Navigator.pushNamed(context, '/thired');
                      } else {
                        // Get.snackbar(
                        //     'Login Failed', 'Ivalid Email Id and Password',
                        //     duration: const Duration(seconds: 3));
                      }
                    },
                    child: const Text('SignIn')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to food shope?'),
                  ElevatedButton(
                      onPressed: (() {
                        Get.to(const SignUpPage());
                      }),
                      child: const Text('SignUp'))
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
