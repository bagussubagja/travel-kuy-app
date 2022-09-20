// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.idUser,
        required this.email,
        required this.password,
        required this.name,
        required this.gender,
    });

    String idUser;
    String email;
    String password;
    String name;
    String gender;

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
}
