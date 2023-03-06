import 'package:flutter/material.dart';
import 'package:yuma_test/api_service/apis.dart';
import 'package:yuma_test/login/login.dart';
import 'package:yuma_test/main.dart';
import 'package:yuma_test/utils/cache.dart';

import '../api_service/login_response_model.dart';

class SignUpProvider extends ChangeNotifier {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  LoginResponse? response;

  SignUpProvider(BuildContext context);

  toLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const Login();
    }));
  }

  register(BuildContext context) async {

    if(validate(firstNameController.text,
        lastNameController.text,
        emailController.text,
        userController.text,
        passwordController.text)){

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
            return const MyHomePage();
          }));
        } else {
          await CacheData.saveUserData(
              "user", [userController.text, passwordController.text]);
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return const MyHomePage();
          }));
        }
      } else {
        // error
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Can't proceed with empty fields!")));
    }

  }

  bool validate(String f,l,e,u,p) {
    // shortcut validation
    if(f.isNotEmpty && l.isNotEmpty && e.isNotEmpty && u.isNotEmpty && p.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }
}
