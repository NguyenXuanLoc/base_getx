// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.userId,
    this.role,
    this.refreshToken,
    required this.token,
  });

  int userId;
  String? role;
  String? refreshToken;
  String token;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        userId: json["user_id"],
        role: json["role"],
        refreshToken: json["refresh_token"] ?? json["resfresh_token"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role": role,
        "refresh_token": refreshToken,
        "token": token,
      };
}
