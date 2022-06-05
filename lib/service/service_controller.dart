import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'auth_service.dart';

class AuthenticationServiceController extends GetxController {
  AuthenticationService authservice =
      AuthenticationService(FirebaseAuth.instance);

  Future<bool> registerUser(String email, String password) async {
    var result = await authservice.signUp(email: email, password: password);
    return result;
  }

  Future<bool> validateUser(String email, String password) async {
    var result = await authservice.signIn(email: email, password: password);
    return result;
  }

  Future<void> signOut() async {
    await authservice.signOut();
  }
}
