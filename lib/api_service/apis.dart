import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:yuma_test/api_service/login_response_model.dart';

class Api {
  final dio = Dio();
  String baseUrl = "https://labapi.yuma-technology.co.uk:8443/delivery";

  Future<LoginResponse?> login(String user, pass) async {
    LoginResponse? data;
    final response = await dio.post(
      "$baseUrl/consumer/login",
      data: {"username": user, "password": pass},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
      print(response.data);
    }


    if (response.statusCode == 200) {
      data = LoginResponse.fromJson(response.data);
    } else {
      //data is null
    }

    return data;
  }

  Future<String> registration(
      String firstName, lastName, email, user, pass) async {
    String data;
    var response;
    try {
      response = await dio.post(
        "$baseUrl/consumer/register",
        data: {
          "username": user,
          "password": pass,
          "email": email,
          "profile": {"first_name": firstName, "last_name": lastName}
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("exception is $e");
      }
    }

    if (kDebugMode) {
      print(response.statusCode);
      print(response.data);
      print(response.statusMessage);// completed
    }

    if (response.statusCode == 201) {
      data = "success";
    } else {
      data = "";
    }

    return data;
  }
}
