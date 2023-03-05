import 'package:dio/dio.dart';
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
    print(response.statusCode);
    print(response.data);

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
          "username": "test2",
          "password": "pass2",
          "email": "test2@gmail.com",
          "profile": {"first_name": "testName1", "last_name": "testName2"}
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
    } catch (e) {
      print("exception is " + e.toString());
    }

    print(response.statusCode);
    print(response.data);
    print(response.statusMessage); // completed
    if (response.statusCode == 201) {
      data = "success";
    } else {
      data = "";
    }

    return data;
  }
}
