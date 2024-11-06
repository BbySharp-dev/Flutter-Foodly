import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    final String addressLine1;
    final String postalCode;
    final bool addressModelDefault;
    final String deliveryInstructions;
    final double latitude;
    final double longitude;

    AddressModel({
        required this.addressLine1,
        required this.postalCode,
        required this.addressModelDefault,
        required this.deliveryInstructions,
        required this.latitude,
        required this.longitude,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressLine1: json["addressLine1"],
        postalCode: json["postalCode"],
        addressModelDefault: json["default"],
        deliveryInstructions: json["deliveryInstructions"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "addressLine1": addressLine1,
        "postalCode": postalCode,
        "default": addressModelDefault,
        "deliveryInstructions": deliveryInstructions,
        "latitude": latitude,
        "longitude": longitude,
    };
}
