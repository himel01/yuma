import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.sessionId,
    required this.consumerUuid,
  });

  String sessionId;
  String consumerUuid;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    sessionId: json["session_id"],
    consumerUuid: json["consumer_uuid"],
  );

  Map<String, dynamic> toJson() => {
    "session_id": sessionId,
    "consumer_uuid": consumerUuid,
  };
}
