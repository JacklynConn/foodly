import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  final String id;
  final String title;
  final String time;
  final List<String> foodTags;
  final String category;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;

  FoodModel({
    required this.id,
    required this.title,
    required this.time,
    required this.foodTags,
    required this.category,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    id: json["_id"],
    title: json["title"],
    time: json["time"],
    foodTags: List<String>.from(json["foodTags"].map((x) => x)),
    category: json["category"],
    foodType: List<String>.from(json["foodType"].map((x) => x)),
    code: json["code"],
    isAvailable: json["isAvailable"],
    restaurant: json["restaurant"],
    rating: json["rating"]?.toDouble(),
    ratingCount: json["ratingCount"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "time": time,
    "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
    "category": category,
    "foodType": List<dynamic>.from(foodType.map((x) => x)),
    "code": code,
    "isAvailable": isAvailable,
    "restaurant": restaurant,
    "rating": rating,
    "ratingCount": ratingCount,
    "description": description,
    "price": price,
    "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
  };
}

class Additive {
  final int id;
  final String title;
  final String price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
    id: json["id"],
    title: json["title"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
  };
}
