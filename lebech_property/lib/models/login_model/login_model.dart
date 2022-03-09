// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] ?? "Failed",
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.token,
  });

  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
