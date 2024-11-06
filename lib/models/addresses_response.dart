// To parse this JSON data, do
//
//     final addressResponse = addressResponseFromJson(jsonString);

import 'dart:convert';

List<AddressResponse> addressResponseFromJson(String str) => List<AddressResponse>.from(json.decode(str).map((x) => AddressResponse.fromJson(x)));

String addressResponseToJson(List<AddressResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressResponse {
    final String id;
    final String userId;
    final String addressLine1;
    final String postalCode;
    final bool addressResponseDefault;
    final String deliveryInstructions;
    final double latitude;
    final double longitude;
    final int v;

    AddressResponse({
        required this.id,
        required this.userId,
        required this.addressLine1,
        required this.postalCode,
        required this.addressResponseDefault,
        required this.deliveryInstructions,
        required this.latitude,
        required this.longitude,
        required this.v,
    });

    factory AddressResponse.fromJson(Map<String, dynamic> json) => AddressResponse(
        id: json["_id"],
        userId: json["userId"],
        addressLine1: json["addressLine1"],
        postalCode: json["postalCode"],
        addressResponseDefault: json["default"],
        deliveryInstructions: json["deliveryInstructions"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "addressLine1": addressLine1,
        "postalCode": postalCode,
        "default": addressResponseDefault,
        "deliveryInstructions": deliveryInstructions,
        "latitude": latitude,
        "longitude": longitude,
        "__v": v,
    };
}
