import 'package:dio/dio.dart';

class Api {
  final dio = Dio();
  String baseUrl = "https://labapi.yuma-technology.co.uk:8443/delivery";

  Future<String> login(String user,pass) async {
    var data;
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
    if(response.statusCode==200){
      data=response.data.toString();
    }else{
      data="";
    }

    print(response.statusCode);
    print(response);
    return data;
  }
}
