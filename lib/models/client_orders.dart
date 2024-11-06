// To parse this JSON data, do
//
//     final clientOrders = clientOrdersFromJson(jsonString);

import 'dart:convert';

List<ClientOrders> clientOrdersFromJson(String str) => List<ClientOrders>.from(json.decode(str).map((x) => ClientOrders.fromJson(x)));

String clientOrdersToJson(List<ClientOrders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientOrders {
    final String id;
    final String userId;
    final List<OrderItem> orderItems;
    final double orderTotal;
    final double deliveryFee;
    final double grandTotal;
    final String deliveryAddress;
    final String restaurantAddress;
    final String paymentMethod;
    final String paymentStatus;
    final String orderStatus;
    final String restaurantId;
    final List<double> restaurantCoords;
    final List<double> recipientCoords;
    final String driverId;
    final int rating;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    ClientOrders({
        required this.id,
        required this.userId,
        required this.orderItems,
        required this.orderTotal,
        required this.deliveryFee,
        required this.grandTotal,
        required this.deliveryAddress,
        required this.restaurantAddress,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.orderStatus,
        required this.restaurantId,
        required this.restaurantCoords,
        required this.recipientCoords,
        required this.driverId,
        required this.rating,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory ClientOrders.fromJson(Map<String, dynamic> json) => ClientOrders(
        id: json["_id"],
        userId: json["userId"],
        orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
        orderTotal: json["orderTotal"]?.toDouble(),
        deliveryFee: json["deliveryFee"]?.toDouble(),
        grandTotal: json["grandTotal"]?.toDouble(),
        deliveryAddress: json["deliveryAddress"],
        restaurantAddress: json["restaurantAddress"],
        paymentMethod: json["paymentMethod"],
        paymentStatus: json["paymentStatus"],
        orderStatus: json["orderStatus"],
        restaurantId: json["restaurantId"],
        restaurantCoords: List<double>.from(json["restaurantCoords"].map((x) => x?.toDouble())),
        recipientCoords: List<double>.from(json["recipientCoords"].map((x) => x?.toDouble())),
        driverId: json["driverId"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "orderTotal": orderTotal,
        "deliveryFee": deliveryFee,
        "grandTotal": grandTotal,
        "deliveryAddress": deliveryAddress,
        "restaurantAddress": restaurantAddress,
        "paymentMethod": paymentMethod,
        "paymentStatus": paymentStatus,
        "orderStatus": orderStatus,
        "restaurantId": restaurantId,
        "restaurantCoords": List<dynamic>.from(restaurantCoords.map((x) => x)),
        "recipientCoords": List<dynamic>.from(recipientCoords.map((x) => x)),
        "driverId": driverId,
        "rating": rating,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class OrderItem {
    final FoodId foodId;
    final int quantity;
    final double price;
    final List<String> additives;
    final String instructions;
    final String id;

    OrderItem({
        required this.foodId,
        required this.quantity,
        required this.price,
        required this.additives,
        required this.instructions,
        required this.id,
    });

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        foodId: FoodId.fromJson(json["foodId"]),
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
        additives: List<String>.from(json["additives"].map((x) => x)),
        instructions: json["instructions"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "foodId": foodId.toJson(),
        "quantity": quantity,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x)),
        "instructions": instructions,
        "_id": id,
    };
}

class FoodId {
    final String id;
    final String title;
    final double rating;
    final List<String> imageUrl;
    final String time;

    FoodId({
        required this.id,
        required this.title,
        required this.rating,
        required this.imageUrl,
        required this.time,
    });

    factory FoodId.fromJson(Map<String, dynamic> json) => FoodId(
        id: json["_id"],
        title: json["title"],
        rating: json["rating"]?.toDouble(),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "rating": rating,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "time": time,
    };
}
