// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(
    json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
    this.id,
    this.userId,
    this.placeTourismId,
    this.message,
    this.timestamp,
    this.createdAt,
    this.users,
  });

  int? id;
  String? userId;
  int? placeTourismId;
  String? message;
  String? timestamp;
  String? createdAt;
  Users? users;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        userId: json["user_id"],
        placeTourismId: json["place_tourism_id"],
        message: json["message"],
        timestamp: json["timestamp"],
        createdAt: json["created_at"],
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "place_tourism_id": placeTourismId,
        "message": message,
        "timestamp": timestamp,
        "created_at": createdAt,
      };
}

class Users {
  Users({
    this.id,
    this.idUser,
    this.email,
    this.name,
    this.gender,
  });

  int? id;
  String? idUser;
  String? email;
  String? name;
  String? gender;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        idUser: json["id_user"],
        email: json["email"],
        name: json["name"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "email": email,
        "name": name,
        "gender": gender,
      };
}
