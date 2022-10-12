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
    required this.gallery,
    required this.operationalHour,
    required this.status,
    required this.reviewerName,
    required this.coordinate,
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
  List<String> gallery;
  String operationalHour;
  String status;
  List<String> reviewerName;
  String coordinate;

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
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        operationalHour: json["operationalHour"],
        status: json["status"],
        reviewerName: List<String>.from(json["reviewerName"].map((x) => x)),
        coordinate: json["coordinate"],
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
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "operationalHour": operationalHour,
        "status": status,
        "reviewerName": List<dynamic>.from(reviewerName.map((x) => x)),
        "coordinate": coordinate,
      };
}
