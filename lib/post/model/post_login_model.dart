// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? clientKey;
  String? deviceType;
  String? email;
  String? password;

  LoginModel({
    this.clientKey,
    this.deviceType,
    this.email,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "email": email,
        "password": password,
      };
}
