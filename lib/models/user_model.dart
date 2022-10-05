// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.idUser,
    this.email,
    this.password,
    this.name,
    this.gender,
  });

  String? idUser;
  String? email;
  String? password;
  String? name;
  String? gender;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "email": email,
        "password": password,
        "name": name,
        "gender": gender,
      };

      Map<String, dynamic> updateName() => {
        "name": name,
      };
}
