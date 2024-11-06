// To parse this JSON data, do
//
//     final cartRequest = cartRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartRequest cartRequestFromJson(String str) => CartRequest.fromJson(json.decode(str));

String cartRequestToJson(CartRequest data) => json.encode(data.toJson());

class CartRequest {
    final String productId;
    final List<String> additives;
    final int quantity;
    final double totalPrice;

    CartRequest({
        required this.productId,
        required this.additives,
        required this.quantity,
        required this.totalPrice,
    });

    factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        productId: json["productId"],
        additives: List<String>.from(json["additives"].map((x) => x)),
        quantity: json["quantity"],
        totalPrice: json["totalPrice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "additives": List<dynamic>.from(additives.map((x) => x)),
        "quantity": quantity,
        "totalPrice": totalPrice,
    };
}
