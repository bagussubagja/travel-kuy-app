// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

List<PlaceModel> placeModelFromJson(String str) =>
    List<PlaceModel>.from(json.decode(str).map((x) => PlaceModel.fromJson(x)));

String placeModelToJson(List<PlaceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceModel {
  PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.district,
    required this.province,
    required this.price,
    required this.review,
    required this.rating,
    required this.category,
    required this.photo,
    required this.openingHour,
    required this.status,
  });

  int id;
  String name;
  String description;
  String address;
  String district;
  String province;
  int price;
  List<String> review;
  String rating;
  String category;
  List<String> photo;
  String openingHour;
  String status;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        district: json["district"],
        province: json["province"],
        price: json["price"],
        review: List<String>.from(json["review"].map((x) => x)),
        rating: json["rating"],
        category: json["category"],
        photo: List<String>.from(json["photo"].map((x) => x)),
        openingHour: json["opening_hour"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "district": district,
        "province": province,
        "price": price,
        "review": List<dynamic>.from(review.map((x) => x)),
        "rating": rating,
        "category": category,
        "photo": List<dynamic>.from(photo.map((x) => x)),
        "opening_hour": openingHour,
        "status": status,
      };
}
