// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    final String id;
    final String username;
    final String email;
    final String fcm;
    final bool verification;
    final String phone;
    final bool phoneVerification;
    final String userType;
    final String profile;
    final String userToken;

    LoginResponse({
        required this.id,
        required this.username,
        required this.email,
        required this.fcm,
        required this.verification,
        required this.phone,
        required this.phoneVerification,
        required this.userType,
        required this.profile,
        required this.userToken,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        fcm: json["fcm"],
        verification: json["verification"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        profile: json["profile"],
        userToken: json["userToken"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "fcm": fcm,
        "verification": verification,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "profile": profile,
        "userToken": userToken,
    };
}
