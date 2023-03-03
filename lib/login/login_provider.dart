import 'package:flutter/material.dart';

import '../api_service/apis.dart';
import '../api_service/login_response_model.dart';

class LoginProvider extends ChangeNotifier {
  var userController = TextEditingController(text: "siam@tech-novo.uk");
  var passwordController = TextEditingController(text: "test12345");
  bool passwordVisible = false;
  String response="";

  LoginProvider(BuildContext context) {
  }

  changeVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
  login(BuildContext context) async {
    response= await Api().login(userController.text,passwordController.text);
    if(response.isNotEmpty){
     LoginResponse loginResponse= loginResponseFromJson(response);
     //save data and continue to home page
    }else{
      //error
    }
  }
}
