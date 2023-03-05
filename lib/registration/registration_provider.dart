import 'package:flutter/material.dart';
import 'package:yuma_test/api_service/apis.dart';
import 'package:yuma_test/login/login.dart';
import 'package:yuma_test/main.dart';
import 'package:yuma_test/utils/cache.dart';

import '../api_service/login_response_model.dart';

class SignUpProvider extends ChangeNotifier {
  var userController = TextEditingController(text: "siam@tech-novo.uk");
  var passwordController = TextEditingController(text: "test12345");
  var emailController = TextEditingController(text: "siam@tech-novo.uk");
  var firstNameController = TextEditingController(text: "siam");
  var lastNameController = TextEditingController(text: "hasan");
  LoginResponse? response;

  SignUpProvider(BuildContext context) {}

  toLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return Login();
    }));
  }

  register(BuildContext context) async {
    String response = await Api().registration(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        userController.text,
        passwordController.text);
    if (response == "success") {
      // to home page
      bool isSaved = await CacheData.saveUserData(
          "user", [userController.text, passwordController.text]);
      if (isSaved) {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return MyHomePage();
        }));
      } else {
        await CacheData.saveUserData(
            "user", [userController.text, passwordController.text]);
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return MyHomePage();
        }));
      }
    } else {
      // error
    }
  }
}
