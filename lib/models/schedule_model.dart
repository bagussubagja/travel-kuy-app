// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

List<ScheduleModel> scheduleModelFromJson(String str) => List<ScheduleModel>.from(json.decode(str).map((x) => ScheduleModel.fromJson(x)));

String scheduleModelToJson(List<ScheduleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleModel {
    ScheduleModel({
        this.id,
        required this.name,
        required this.startDate,
        required this.endDate,
        required this.thumbnail,
        required this.numOfPerson,
        required this.totalPrice,
        required this.idUser,
        required this.idPlace,
    });

    int? id;
    String name;
    String startDate;
    String endDate;
    String thumbnail;
    int numOfPerson;
    int totalPrice;
    String idUser;
    int idPlace;

    factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        id: json["id"],
        name: json["name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        thumbnail: json["thumbnail"],
        numOfPerson: json["num_of_person"],
        totalPrice: json["total_price"],
        idUser: json["id_user"],
        idPlace: json["id_place"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "start_date": startDate,
        "end_date": endDate,
        "thumbnail": thumbnail,
        "num_of_person": numOfPerson,
        "total_price": totalPrice,
        "id_user": idUser,
        "id_place": idPlace,
    };
}
