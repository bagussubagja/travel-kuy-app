// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

List<FavoriteModel> favoriteModelFromJson(String str) => List<FavoriteModel>.from(json.decode(str).map((x) => FavoriteModel.fromJson(x)));

String favoriteModelToJson(List<FavoriteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteModel {
    FavoriteModel({
        this.id,
        this.name,
        this.description,
        this.address,
        this.district,
        this.province,
        this.price,
        this.review,
        this.rating,
        this.category,
        this.gallery,
        this.operationalHour,
        this.status,
        this.reviewerName,
        required this.idPlace,
        required this.idUser,
        required this.favUnique,
        this.coordinate
    });

    int? id;
    String? name;
    String? description;
    String? address;
    String? district;
    String? province;
    int? price;
    List<String>? review;
    String? rating;
    String? category;
    List<String>? gallery;
    String? operationalHour;
    String? status;
    List<String>? reviewerName;
    int idPlace;
    String idUser;
    String favUnique;
    String? coordinate;

    factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
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
        idPlace: json["id_place"],
        idUser: json["id_user"],
        favUnique: json["fav_unique"],
        coordinate: json["coordinate"]
    );

    Map<String, dynamic> toJson() => {
        "id_place": idPlace,
        "id_user": idUser,
        "fav_unique": favUnique,
    };
}
