import 'package:flutter/material.dart';
import 'package:yuma_test/main.dart';
import 'package:yuma_test/registration/registration.dart';

import '../api_service/apis.dart';
import '../api_service/login_response_model.dart';
import '../utils/cache.dart';

class LoginProvider extends ChangeNotifier {
  var userController = TextEditingController(text: "siam@tech-novo.uk");
  var passwordController = TextEditingController(text: "test12345");
  bool passwordVisible = false;
  LoginResponse? response;
  List<String> userInfo = [];

  LoginProvider(BuildContext context) {
    getPreviousUser();
  }

  getPreviousUser() async {
    userInfo = await CacheData.getUserData("user");
    if (userInfo.isEmpty) {
      // no previous user
      print("empty");
    } else {
      userController.text = userInfo[0];
      passwordController.text = userInfo[1]; //bad practice
      notifyListeners();
      print("not empty");
    }
  }

  changeVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  login(BuildContext context) async {
    response = await Api().login(userController.text, passwordController.text);
    if (response != null) {
      print(response?.consumerUuid);
      print(response?.sessionId);
      //save data and continue to home page
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
      //error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error!! Try later"),
        ),
      );
    }
  }

  toRegistration(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return SignUp();
    }));
  }
}
